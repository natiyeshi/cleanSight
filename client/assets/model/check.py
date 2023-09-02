
# import numpy as np
# import tensorflow as tf

# # Load the TFLite model and allocate tensors.
# interpreter = tf.lite.Interpreter(model_path="model_unquant.tflite")
# interpreter.allocate_tensors()

# # Get input and output tensors.
# input_details = interpreter.get_input_details()
# output_details = interpreter.get_output_details()

# # Test the model on random input data.
# input_shape = input_details[0]['shape']
# input_data = np.array(np.random.random_sample(input_shape), dtype=np.float32)
# interpreter.set_tensor(input_details[0]['index'], input_data)

# interpreter.invoke()

# # The function `get_tensor()` returns a copy of the tensor data.
# # Use `tensor()` in order to get a pointer to the tensor.
# output_data = interpreter.get_tensor(output_details[0]['index'])
# print(output_data)

# import numpy as np
# import tensorflow as tf
# from PIL import Image

# # Load the TFLite model
# interpreter = tf.lite.Interpreter(model_path='model_unquant.tflite')
# interpreter.allocate_tensors()

# # Get input and output details
# input_details = interpreter.get_input_details()
# output_details = interpreter.get_output_details()

# # Preprocess the image
# image = Image.open('eye.jpg')
# image = image.resize((224, 224))  # Resize to match model's input shape
# image = np.array(image) / 255.0  # Normalize pixel values (example)

# # Set input tensor
# interpreter.set_tensor(input_details[0]['index'], np.expand_dims(image, axis=0))

# # Run inference
# interpreter.invoke()

# # Get the output tensor
# output_tensor = interpreter.get_tensor(output_details[0]['index'])

# # Interpret the results
# predicted_class = np.argmax(output_tensor, axis=1)
# class_probabilities = output_tensor[0]

# print("Predicted Class:", predicted_class)
# print("Class Probabilities:", class_probabilities)

import numpy as np
import tensorflow as tf
from PIL import Image

# Load the TFLite model
interpreter = tf.lite.Interpreter(model_path='model_unquant.tflite')
interpreter.allocate_tensors()

# Get input and output details
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Preprocess the image
image = Image.open('human-eye.webp')
image = image.resize((224, 224))  # Resize to match model's input shape
image = np.array(image) / 255.0  # Normalize pixel values (example)

# Convert image array to FLOAT32
image = image.astype(np.float32)

# Set input tensor
interpreter.set_tensor(input_details[0]['index'], np.expand_dims(image, axis=0))

# Run inference
interpreter.invoke()

# Get the output tensor
output_tensor = interpreter.get_tensor(output_details[0]['index'])

# Interpret the results
predicted_class = np.argmax(output_tensor, axis=1)
class_probabilities = output_tensor[0]

print("Predicted Class:", predicted_class)
print("Class Probabilities:", class_probabilities)