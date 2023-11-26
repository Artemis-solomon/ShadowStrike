# ShadowStrike

**ShadowStrike** is an interactive bash script designed to provide an educational and controlled environment for simulating SSH brute force attacks. By utilizing this script, users can gain insights into potential security vulnerabilities and learn about the importance of robust authentication mechanisms.

## Features

- **Interactive Configuration:** The script guides users through a step-by-step configuration process. Users input the target host, port, paths to username and password lists, and the desired output file for storing successful login attempts.

- **Resource Check:** Prior to executing any attack, the script verifies the presence of required files, such as the username and password lists. Additionally, it checks for the availability of the Hydra tool, alerting the user if it's not found.

- **Automated Brute Force Attacks:** The script employs the powerful Hydra tool to automate the execution of brute force attacks. It iterates through the provided username and password lists, attempting to gain unauthorized access to the target system.

- **Informative Messaging:** Throughout the attack process, the script provides informative messages and error handling. This ensures that users understand the progress of the attack and any potential issues that arise.

- **Repeat or Exit:** Upon completing an attack, the script prompts users to decide whether to repeat the attack or exit the script. This feature allows for iterative learning and testing.

## Usage

1. Clone the repository or download the script.
2. Make the script executable: `chmod +x shadowstrike.sh`
3. Run the script: `./shadowstrike.sh`
4. Follow the interactive prompts to configure the attack parameters.
5. Observe the attack results and gain insights into potential vulnerabilities.

**Note:** ShadowStrike is intended exclusively for educational and ethical security testing. It should be used responsibly and only on systems for which you have explicit authorization to test.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact
For questions, feedback, or collaborations, please reach out to us at: artemis@dnmx.org

## Disclaimer

The authors of this script are not accountable for any misuse or unauthorized access. Use this script only in accordance with legal and ethical standards. Always obtain proper authorization before testing or probing any system.

## Contributing

Contributions are enthusiastically welcomed! If you identify any issues or have ideas for enhancing the script, please feel free to open a pull request.

---

**"ShadowStrike"** – Empowering understanding of security through responsible exploration of vulnerabilities.

