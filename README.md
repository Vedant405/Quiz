# 🎯 Quiz App - Flutter Project

## **Project Overview**
The Quiz App is an interactive mobile application built using Flutter, designed to make learning and self-assessment fun. With gamified UI elements, users can test their knowledge through a series of multiple-choice questions and receive immediate feedback on their performance.

Key features include:
- **Gamified UI**: Engaging user interface with progress tracking and motivational feedback.
- **Dynamic Quiz Content**: Fetches questions dynamically from an API.
- **Score Feedback**: Displays a summary of the quiz performance in an interactive manner.
- **Responsive Design**: Optimized for all screen sizes.

---

## **Setup Instructions**

To run this project locally, follow these steps:

1. **Prerequisites**:
   - Install Flutter ([Flutter installation guide](https://flutter.dev/docs/get-started/install))
   - Install an IDE (e.g., Android Studio or Visual Studio Code)

2. **Clone the Repository**:
   `git clone <your-repository-link>`
   `cd quiz_app`

3. **Install Dependencies**:
   Run the following command to install the required packages:
   `flutter pub get`

4. **Run the App**:
   Connect an emulator or physical device and run:
   `flutter run`

---

## **App Structure**
  
The app consists of the following screens:
1. Home Screen: A gamified entry point with a "Start Quiz" button.
2. Quiz Screen: Displays questions with multiple options, progress tracking, and score calculations.
3. Result Screen: Summarizes the user's performance with motivational feedback.

---

## **API Integration**

The app fetches quiz questions from the following API:
`https://api.jsonserve.com/Uw5CrX`

---

## Screenshots

### Home Screen
![Home Screen](screenshots/home_screen.png)

### Quiz Screen
![Quiz Screen](screenshots/quiz_screen.png)

### Result Screen
![Result Screen](screenshots/result_screen.png)

---

## Video Walkthrough

[Click here to view the video walkthrough](video_link_here)

---

## Dependencies

The project uses the following dependencies:

- **http**: For fetching questions from the API.
- **flutter/material.dart**: For building the UI components.
- **custom_fonts**: Fonts like BalsamiqSans are used for styling.

---

## Future Work

Here are some ideas for enhancing the Quiz App in the future:

1. **Audio Integration**  
   - Add background music to create a more engaging atmosphere.  
   - Provide audio feedback for correct and incorrect answers.  
   - Include a voice-over option to read out questions and answers.

2. **Rewards and Badges**  
   - Introduce a reward system where users earn points or badges for completing quizzes.  
   - Unlock special badges for high scores or streaks of correct answers.

3. **User Profiles**  
   - Allow users to create profiles to track their progress and scores over time.  
   - Enable profile personalization, such as adding avatars and usernames.

4. **Timer and Streaks**  
   - Add a countdown timer to increase the challenge of answering questions quickly.  
   - Track streaks of correct answers and reward bonus points.

5. **In-App Purchases and Monetization**  
   - Offer premium features such as exclusive quiz categories, extra lives, or ad removal through in-app purchases.  
   - Add rewarded ads for hints or skipping difficult questions.

---


