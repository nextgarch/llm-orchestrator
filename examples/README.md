# Remote API Example

> Note: From now onwards, all commands must be run from a non-Ansible terminal.

Now that we have an LLM provider and server instance running, we can issue prompts from `python` and get responses.
We will be using `aisuite` with `python3.10` for this purpose.
For more details, please visit [aisuite](https://github.com/andrewyng/aisuite/tree/main).

```sh
pip install aisuite
```

To run the provided example, simply use the following command:

```sh
python examples/aisuite-api.py
```

Expected response would be something like this:

```md
## Purdue's CS Department: A Brief History

Purdue University's Computer Science Department boasts a rich history, dating back to the early days of computing. 

**Origins:**

* The Department of Electrical Engineering and Computer Science (EECS) was established in **1962**, encompassing both electrical engineering and computer science.
* Computer science as a separate discipline started gaining traction in the late 1960s.
* In **1973**, the Department of Computer Science was officially formed as a separate entity within EECS.

**Evolution:**

* Throughout the 1980s and 1990s, the CS department grew steadily, attracting top-notch faculty and students.
* In the early 2000s, the department underwent a major expansion, adding new faculty and facilities to keep pace with the rapid evolution of the field.
* Today, the Department of Computer Science is one of the largest and most respected in the nation.

**Present Day:**

* The department offers undergraduate and graduate programs in Computer Science, encompassing a wide range of areas like:
    * Artificial Intelligence
    * Cybersecurity
    * Computer Graphics & Visualization
    * Human-Computer Interaction
    * Parallel & Distributed Systems
* Ranked #20 in the 2024 US News & World Report Best Computer Science Programs, Purdue's CS department attracts top students and consistently produces successful graduates.

**Fun Facts:**

* Purdue has produced **more than 70 PhD graduates who have become full professors at other universities**, highlighting its impactful role in shaping the field.
* The department boasts numerous awards and recognitions, including the prestigious **ACM Grace Hopper Award**.
* Notable alumni include pioneers in fields like computer vision, robotics, and human-computer interaction.
```