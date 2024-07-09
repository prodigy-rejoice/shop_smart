![Screenshot_20240709_002634](https://github.com/rejoice-omotunwase/shop_smart/assets/108352463/745be74a-78f9-41a5-a1de-457eac7a36b0)![Screenshot_20240709_002634](https://github.com/rejoice-omotunwase/shop_smart/assets/108352463/aa02bafd-ef45-4a73-9096-95f20d672091)# shop_smart

This is HNG Task 2 - it is a simple shopping app which calls a Timbu API to get a list of products and the description of those products.

## App Information
This application has two screens - the "Products Screen" to view all the products from Timbu API, and a "Details Screen" to view a short description of each product/item.
Each item is placed on a Card with an image, a name, and a price on the product screen.
When an item is pressed, it pushes to the details screen which displays little information about that product - the description is also gotten from Timbu API.

## Setup Information
To set up this flutter project locally,
- Clone this repository
- Get dependencies
- Run the app
- Enjoy the simple app

  ## Technicalities
  The following packages were added to the application:
  - HTTP:-  a Dart library that simplifies making HTTP requests in Flutter applications. It allows us to interact with RESTful APIs, fetch data from servers, send data to backends, and               much more.
  - cached_network_image:- is a Flutter library that allows you to cache images. Caching is a process that temporarily stores data, in this case, images, for faster access in the future.                            This package not only allows you to cache images but also supports placeholders and fading images while the image loads

## API Integration
To use Timbu API:
- I created an account with the Timbu API organization
- I generated my ApiKey and got my OrganizationId and ApiId as well.
- I added products to my API account - each has an image, a price, a description, and a name.
- I implemented the API into my app so that the products added to the account are now displayed in a list,  into the application.

## Images of the App
![Screenshot_20240709_002543](https://github.com/rejoice-omotunwase/shop_smart/assets/108352463/4880d2e1-0e00-42a9-b326-1d54dd42b3bc)
![Screenshot_20240709_002634](https://github.com/rejoice-omotunwase/shop_smart/assets/108352463/2dcffb5e-8331-41c1-b18a-4fa67a80c19b)
![Screenshot_20240709_002619](https://github.com/rejoice-omotunwase/shop_smart/assets/108352463/f2c18019-083b-4edd-b206-26866fdfc8b0)

## Other Details:
- Appetize Link: https://appetize.io/app/b_jypdutggooxrnbusbiqsu5v4gq  [this might take time to load, or might not load, you can check the link below as well ]
- APK Download: https://drive.google.com/file/d/1zjdKH9w1Sr3WbIbtHu594m2vFT3skFv5/view?usp=sharing
