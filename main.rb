require 'zxcvbn'  # For password strength estimation
require 'bcrypt'  # For password hashing

class PasswordAnalyzer
  def initialize
    @minimum_length = 12
    @required_character_types = {
      uppercase: /[A-Z]/,
      lowercase: /[a-z]/,
      numbers: /[0-9]/,
      special: /[^A-Za-z0-9]/
    }
  end

  def analyze_password(password)
    results = {
      length_check: check_length(password),
      character_checks: check_character_types(password),
      common_patterns: check_common_patterns(password),
      strength_score: calculate_strength_score(password),
      secure_hash: hash_password(password)
    }
    
    generate_report(results)
  end

  private

  def check_length(password)
    {
      passed: password.length >= @minimum_length,
      message: "Password length: #{password.length}/#{@minimum_length} required characters"
    }
  end

  def check_character_types(password)
    results = {}
    @required_character_types.each do |type, regex|
      matches = password.match?(regex)
      results[type] = {
        passed: matches,
        message: "#{type.to_s.capitalize}: #{matches ? '✓' : '✗'}"
      }
    end
    results
  end

  def check_common_patterns(password)
    patterns = {
      keyboard_sequence: /(qwert|asdf|zxcv)/i,
      repeated_chars: /(.)\1{2,}/,
      sequential_numbers: /(012|123|234|345|456|567|678|789)/
    }

    results = {}
    patterns.each do |pattern_name, regex|
      matches = password.match?(regex)
      results[pattern_name] = {
        passed: !matches,
        message: "#{pattern_name.to_s.gsub('_', ' ').capitalize}: #{matches ? 'Found' : 'None found'}"
      }
    end
    results
  end

  def calculate_strength_score(password)
    # Using zxcvbn for advanced password strength estimation
    strength = Zxcvbn.test(password)
    {
      score: strength.score,  # 0-4 score
      crack_time: strength.crack_time_display,
      suggestions: strength.feedback.suggestions
    }
  end

  def hash_password(password)
    # Using BCrypt for secure password hashing
    BCrypt::Password.create(password)
  end

  def generate_report(results)
    report = []
    report << "\nPassword Analysis Report"
    report << "======================"
    
    report << "\n1. Length Check"
    report << results[:length_check][:message]
    
    report << "\n2. Character Requirements"
    results[:character_checks].each do |_type, check|
      report << check[:message]
    end
    
    report << "\n3. Pattern Analysis"
    results[:common_patterns].each do |_pattern, check|
      report << check[:message]
    end
    
    report << "\n4. Strength Assessment"
    report << "Score: #{results[:strength_score][:score]}/4"
    report << "Estimated crack time: #{results[:strength_score][:crack_time]}"
    
    if results[:strength_score][:suggestions].any?
      report << "\nSuggestions for improvement:"
      results[:strength_score][:suggestions].each do |suggestion|
        report << "- #{suggestion}"
      end
    end
    
    report << "\n5. Secure Hash (BCrypt)"
    report << results[:secure_hash]
    
    report.join("\n")
  end
end 

# Usage Example
password_analyzer = PasswordAnalyzer.new
password = "MyStr0ngP@ssw0rd!"
puts password_analyzer.analyze_password(password)
