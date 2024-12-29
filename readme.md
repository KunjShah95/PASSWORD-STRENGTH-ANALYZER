PasswordAnalyzer ✨

An interactive Ruby-based tool for comprehensive password analysis, including strength estimation, pattern detection, and secure hashing. This utility helps users create and validate strong passwords while providing insightful feedback.

🔧 Features

Password Strength Analysis: Leverages the zxcvbn gem to estimate password strength.

Pattern Detection: Detects keyboard sequences, repeated characters, and sequential numbers.

Character Validation: Verifies the presence of uppercase, lowercase, numbers, and special characters.

Secure Hashing: Hashes passwords securely using BCrypt.

Detailed Reports: Generates a clear and actionable password analysis report.

🔑 Usage

Prerequisites

Ensure you have the following installed:

Ruby (>= 3.2.2)

Gems: zxcvbn-ruby and bcrypt

Install the required gems using:

gem install zxcvbn-ruby bcrypt

Running the Script

Clone the repository:

git clone https://github.com/KunjShah95/PasswordAnalyzer.git
cd PasswordAnalyzer

Run the script:

ruby password_analyzer.rb

Input your password to analyze it and view the detailed report:

password_analyzer = PasswordAnalyzer.new
puts password_analyzer.analyze_password("")

🎯 Example Output
```
# Password Analysis Report

1. Length Check
   Password length: 16/12 required characters

2. Character Requirements
   Uppercase: ✓
   Lowercase: ✓
   Numbers: ✓
   Special: ✓

3. Pattern Analysis
   Keyboard sequence: None found
   Repeated chars: None found
   Sequential numbers: None found

4. Strength Assessment
   Score: 4/4
   Estimated crack time: centuries

5. Secure Hash (BCrypt)
   $2a$12$8qZp3XbZEKlwRk7U98vPd.KzQeT.gP6PKoiDlRGxtW5
```
⚙️ Configuration

Modify the following parameters in the PasswordAnalyzer class to customize behavior:

Minimum Password Length:

@minimum_length = 12

Required Character Types:

@required_character_types = {
uppercase: /[A-Z]/,
lowercase: /[a-z]/,
numbers: /[0-9]/,
special: /[^A-Za-z0-9]/
}

🚀 Future Enhancements

Web Interface:

Build a simple web-based UI using frameworks like Sinatra or Rails.

Password Suggestions:

Generate suggestions for stronger passwords if the provided password is weak.

Integration with Databases:

Store and retrieve password hashes securely using PostgreSQL or MySQL.

API Support:

Create RESTful APIs for password analysis.

Multi-language Support:

Allow localization to support multiple languages in reports.

Real-time Feedback:

Provide dynamic feedback as users type passwords in the UI.

📊 Technical Details

Gems Used:

zxcvbn-ruby: For advanced password strength estimation.

bcrypt: For secure password hashing.

File Structure:

PasswordAnalyzer/
├── password_analyzer.rb # Main script
└── README.md # Project documentation

📢 Contributions

We welcome contributions! Follow these steps to contribute:

Fork the repository.

Create a new branch:

git checkout -b feature-name

Commit your changes:

git commit -m "Add some feature"

Push to the branch:

git push origin feature-name

Open a pull request.

🌐 License

This project is licensed under the MIT License.

🔧 Support

If you have questions or need assistance, please feel free to reach out by opening an issue.

🎉 Acknowledgments

Thanks to:

zxcvbn-ruby for password strength analysis.

bcrypt for secure hashing.

🎨 Made with ❤️ by Kunj Shah
