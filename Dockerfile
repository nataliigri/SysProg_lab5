FROM macos:latest

# Install necessary packages
RUN xcode-select --install

# Install Homebrew (if not already installed)
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the PATH
ENV PATH="/usr/local/bin:/opt/homebrew/bin:${PATH}"

# Install Bison and Flex using Homebrew
RUN brew install bison flex

# Copy the contents of the current directory to /lab
COPY . /sysprog_lab5/

# Navigate to /lab and run the make command
RUN cd /sysprog_lab5 && make calculator
