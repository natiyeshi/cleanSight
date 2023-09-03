import tensorflow as tf
import numpy as np
from PIL import Image
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.conf import settings
import os



@api_view(['POST'])
def getData(request):
    # Assuming the image is sent as a file in the 'image' field of the request
    image_file = request.FILES.get('image')
    if image_file:
        try:
            # Process the image file here
            image = Image.open(image_file)
            image = image.resize((224, 224))  # Resize to match model's input shape
            image = np.array(image) / 255.0  # Normalize pixel values
            image = image.astype(np.float32)  # Convert to FLOAT32

            # Load the TFLite model
            model_path = os.path.join(settings.BASE_DIR, 'models', 'model_unquant.tflite')
            interpreter = tf.lite.Interpreter(model_path=model_path)
            interpreter.allocate_tensors()

            # Get input and output details
            input_details = interpreter.get_input_details()
            output_details = interpreter.get_output_details()

            # Set input tensor
            interpreter.set_tensor(input_details[0]['index'], np.expand_dims(image, axis=0))

            # Run inference
            interpreter.invoke()

            # Get the output tensor
            output_tensor = interpreter.get_tensor(output_details[0]['index'])

            # Interpret the results
            predicted_class = np.argmax(output_tensor, axis=1)
            class_probabilities = output_tensor[0]

            # Return the prediction results as part of the API response
            response_data = {
                'predicted_class': int(predicted_class),
                'class_probabilities': class_probabilities.tolist()
            }
            print(response_data)
            return Response(response_data)
        except Exception as e:
            print("Error")
            print(e)
            return Response({'error': str(e)})

    # Return a response if no image was found in the request
    return Response({'error': 'No image found in the request'}, status=400)