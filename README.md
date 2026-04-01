# 📚 Bookia

A beautiful, feature-rich Flutter application designed for book lovers. This app features a complete authentication flow and onboarding experience with clean and modern UI components.

## ✨ Features

- **Onboarding Experience:** Engaging splash and welcome screens.
- **Complete Authentication:**
  - User Registration & Login
  - Password Recovery & Reset functionality
  - OTP Verification implemented using [`pinput`](https://pub.dev/packages/pinput)
- **State Management:** Handled powerfully with [`flutter_bloc`](https://pub.dev/packages/flutter_bloc).
- **Responsive UI:** Carefully crafted using customized fonts (`DMSerif`) and fluid layouts with [`gap`](https://pub.dev/packages/gap) and [`flutter_svg`](https://pub.dev/packages/flutter_svg).
- **Routing:** Navigation handled smoothly using [`go_router`](https://pub.dev/packages/go_router).
- **Cart & Wishlist:** Complete management of bookmarks and shopping cart with global state synchronization.
- **Order Placement:** Seamless checkout process with address selection.
- **Order History:** View past orders and their current status.
- **Profile Management:** Edit profile details and update security settings.
- **Networking & Storage:** API requests with [`dio`](https://pub.dev/packages/dio) and local caching with [`shared_preferences`](https://pub.dev/packages/shared_preferences).
- **Animations:** Beautiful UI animations using [`lottie`](https://pub.dev/packages/lottie), [`carousel_slider`](https://pub.dev/packages/carousel_slider), and loading effects with [`shimmer`](https://pub.dev/packages/shimmer).
- **🌍 Multi-Language Support:** Fully localized for **Arabic**, **English**, and **Chinese** with RTL (Right-to-Left) support for Arabic.

## 🛠 Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (SDK ^3.10.8)
- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Routing:** [go_router](https://pub.dev/packages/go_router)
- **Networking:** [dio](https://pub.dev/packages/dio)
- **Local Storage:** [shared_preferences](https://pub.dev/packages/shared_preferences)
- **UI & Animations:** [gap](https://pub.dev/packages/gap), [flutter_svg](https://pub.dev/packages/flutter_svg), [lottie](https://pub.dev/packages/lottie), [carousel_slider](https://pub.dev/packages/carousel_slider), [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator), [shimmer](https://pub.dev/packages/shimmer)
- **Input & Validation:** [pinput](https://pub.dev/packages/pinput), [image_picker](https://pub.dev/packages/image_picker)

## 📱 Screenshots

### 🔐 Authentication Flow

<div align="center">
  <table>
    <tr>
      <td align="center"><b>Splash Screen</b><br><img src="Screenshots/splash_screen.jpeg" width="180"/></td>
      <td align="center"><b>Welcome</b><br><img src="Screenshots/welcome_screen.jpeg" width="180"/></td>
      <td align="center"><b>Register</b><br><img src="Screenshots/register_screen.jpeg" width="180"/></td>
    </tr>
    <tr>
      <td align="center"><b>Login</b><br><img src="Screenshots/login_screen.jpeg" width="180"/></td>
      <td align="center"><b>Forgot Password</b><br><img src="Screenshots/forgot_password_screen.jpeg" width="180"/></td>
      <td align="center"><b>OTP Verification</b><br><img src="Screenshots/otp_screen2.jpeg" width="180"/></td>
    </tr>
    <tr>
      <td align="center"><b>New Password</b><br><img src="Screenshots/new_password.jpeg" width="180"/></td>
      <td align="center"><b>Create New Password</b><br><img src="Screenshots/create_new_password.jpeg" width="180"/></td>
      <td align="center"><b>Password Changed</b><br><img src="Screenshots/password_changed.jpeg" width="180"/></td>
    </tr>
  </table>
</div>

### 🏠 Home & Discovery

<div align="center">
  <table>
    <tr>
      <td align="center"><b>Home (Loading)</b><br><img src="Screenshots/home_screen_shimmer.jpeg" width="180"/></td>
      <td align="center"><b>Home Screen</b><br><img src="Screenshots/home_screen.jpeg" width="180"/></td>
      <td align="center"><b>Book Details</b><br><img src="Screenshots/details_screen.jpeg" width="180"/></td>
    </tr>
    <tr>
      <td align="center"><b>Search Results</b><br><img src="Screenshots/search1.jpeg" width="180"/></td>
      <td align="center"><b>Wishlist</b><br><img src="Screenshots/wishlist_screen.jpeg" width="180"/></td>
      <td align="center"><b>Wishlist (2)</b><br><img src="Screenshots/wishlist_screen1.jpeg" width="180"/></td>
    </tr>
  </table>
</div>

### 🛒 Cart & Ordering

<div align="center">
  <table>
    <tr>
      <td align="center"><b>my_orders</b><br><img src="Screenshots/my_orders.jpeg" width="180"/></td>
      <td align="center"><b>place_order</b><br><img src="Screenshots/place_order.jpeg" width="180"/></td>
      <td align="center"><b>governorate</b><br><img src="Screenshots/governorate.jpeg" width="180"/></td>
    </tr>
    <tr>
      <td align="center"><b>place_order1</b><br><img src="Screenshots/place_order1.jpeg" width="180"/></td>
      <td align="center"><b>search</b><br><img src="Screenshots/search.jpeg" width="180"/></td>
      <td align="center">-</td>
    </tr>
  </table>
</div>

### 👤 Profile & History

<div align="center">
  <table>
    <tr>
      <td align="center"><b>profile</b><br><img src="Screenshots/profile.jpeg" width="180"/></td>
      <td align="center"><b>edit_profile</b><br><img src="Screenshots/edit_profile.jpeg" width="180"/></td>
      <td align="center"><b>delete_account</b><br><img src="Screenshots/delete_account.jpeg" width="180"/></td>
    </tr>
  </table>
</div>

### 🌍 Arabic & RTL Support
 
 <div align="center">
   <table>
     <tr>
       <td align="center"><b>Home (Arabic)</b><br><img src="Screenshots/home_arabic.jpeg" width="180"/></td>
       <td align="center"><b>Details (Arabic)</b><br><img src="Screenshots/details_arabic.jpeg" width="180"/></td>
       <td align="center"><b>Checkout (Arabic)</b><br><img src="Screenshots/checkout_arabic.jpeg" width="180"/></td>
     </tr>
     <tr>
       <td align="center"><b>Profile (Arabic)</b><br><img src="Screenshots/profile_arabic.jpeg" width="180"/></td>
       <td align="center"><b>Wishlist (Arabic)</b><br><img src="Screenshots/wishlist_arabic.jpeg" width="180"/></td>
       <td align="center"><b>Update Password (Arabic)</b><br><img src="Screenshots/update_password_arabic.jpeg" width="180"/></td>
     </tr>
     <tr>
       <td align="center"><b>Delete Account (Arabic)</b><br><img src="Screenshots/delete_account_arabic.jpeg" width="180"/></td>
       <td align="center"><b>Empty Cart (Arabic)</b><br><img src="Screenshots/empty_cart_arabic.jpeg" width="180"/></td>
       <td align="center">-</td>
     </tr>
   </table>
 </div>
