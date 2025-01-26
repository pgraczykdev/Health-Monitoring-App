# Health Monitoring App (Work In Progress)

The **Health Monitoring App** is an Oracle APEX application that integrates with the Strava API. The app allows users to track their physical activities, such as running, cycling, and swimming. Users can monitor their performance, view activity history, and analyze their progress over time. The app retrieves activity data (e.g., distance, duration, calories burned) from the Strava API, and this data is displayed in interactive dashboards, charts, and reports within Oracle APEX.

> **Note:** This project is currently a **Work In Progress (WIP)**. Features are actively being developed, and the application is not yet ready for production use. Contributions and feedback are welcome.

## Features (Planned and In Progress)

- **Activity Tracking**: Retrieve and display activities from Strava, such as running, cycling, and swimming.
- **Performance Analysis**: Visualize user performance over time using interactive charts and dashboards.
- **Historical Data**: Show users their historical activities with detailed information like distance, duration, and calories burned.
- **User Authentication**: Authenticate users via Strava OAuth to securely access their activity data.
- **Multi-Device Support**: Provide a responsive design to work across mobile, tablet, and desktop devices.

## Requirements

The following PL/SQL packages are **required** for the application to function correctly:

- **[Logger Log PL/SQL](https://github.com/OraOpenSource/Logger)**: A lightweight and efficient logging framework for PL/SQL used to log application processes and errors for debugging and audit purposes.
- **[utPLSQL](https://github.com/utPLSQL/utPLSQL)**: A unit testing framework for PL/SQL used to validate the correctness and reliability of the codebase through automated tests.

Please ensure these packages are installed in your Oracle environment before running the application.

## Usage

Once the application is set up, users can:
- Authenticate via Strava to connect their account.
- View their activity history and analyze performance through dynamic dashboards and charts.
- Track real-time data such as distance, duration, and calories burned.

## Acknowledgments

Special thanks to the maintainers and contributors of these open-source projects for providing invaluable tools that enhance the quality, stability, and traceability of this application:

- **[Logger Log PL/SQL](https://github.com/OraOpenSource/Logger)**
- **[utPLSQL](https://github.com/utPLSQL/utPLSQL)**
