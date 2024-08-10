// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';


// void main(){
//   print("she wants to die");

//    Future<void> testAddProduct() async {
//     final String apiUrl =
//         'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'; // Replace with your API URL
//     final String imagePath =
//         'C:/Users/MS/Desktop/fluttest/Task6/task6/images/heels.jpg'; // Replace with your image path

//     try {
//       // Check if the file exists
//       File file = File(imagePath);
//       var exist = await file.exists();
//       if (exist) {
//         print('File exists.');
//       } else {
//         print('File does not exist.');
//         return;
//       }

//       // Read the file as bytes
//       // List<int> imageBytes = await file.re??adAsBytes();

//       // Create a multipart request
//       var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

//       // Add the file to the request from bytes
//       request.files.add( await 
//         http.MultipartFile.fromPath(
//           'image', // The name of the file field expected by the API
//           file.path,
//           contentType: MediaType('image','jpg') // Optional: specify a filename
//         ),
//       );

//       // Add any additional fields (product information)
//       request.fields['id'] = '123';
//       request.fields['name'] = 'Test Product';
//       request.fields['price'] = '29.99';
//       request.fields['description'] = 'This is a test product.';

//       print("Sending request...");

//       // Send the request
//       var response = await request.send();

//       // Handle the response
//       if (response.statusCode == 201) {
//         // Read the response body
//         final responseBody = await response.stream.bytesToString();
//         final data = json.decode(responseBody);

//         // Example of creating a ProductModel from the API response
//         var addedProduct = ProductModel.fromJson(data);
//         print(data);
//         // Print the product returned by the API to confirm it was added
//         print(
//             'API Response: ${addedProduct}, ${addedProduct.price}, ${addedProduct.description}');
//       } else {
//            final responseBody = await response.stream.bytesToString();
//         final data = json.decode(responseBody);

        
//         print('Failed to upload file with status code: ${response.statusCode}');
//         print(data);
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//   testAddProduct();
// }