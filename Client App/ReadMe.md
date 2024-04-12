
**Assignment: Building an analytics SDK/Library with `sendEvent` function to send events reliably to the server**

Your task is to create an analytics software development kit (SDK) that allows developers to integrate analytics tracking into their applications. The SDK/Library should provide a **`sendEvent`** function allowing developers to send custom events to the analytics backend to track user actions and behaviors.

**Requirements:**

1. Language: **Swift**
2. Asynchronous Processing: The SDK/Library should perform event submissions asynchronously, without blocking the main application thread or affecting performance.
3. Custom Event Data: The **`sendEvent`** function should accept custom event data, such as event name, and properties.
4. Documentation: Include a README file explaining how to integrate and use your SDK in different platforms and providing clear instructions on using the **`sendEvent`** function.
5. Threading: In the case of language supports multi-thread, this function can be called from any thread. We should be able to handle this in a graceful manner.
6. Ordering guarantee: We want events to go in order on the server side, so we can provide an ordering guarantee to the client of library.

**Protocol**: 

You can assume a REST endpoint is available that returns 200 in case of success, 400 in case of a bad request, and 500 for any server error. 

Endpoint: POST https://www.example.com/event

**Deliverables:**

1. Source code of the analytics SDK.
2. A README file that explains how to integrate and use your SDK on different platforms.
3. Any necessary configuration files or build scripts for the SDK.

**Evaluation Criteria:**

You will be evaluated based on the following criteria:

1. Functionality: Does your SDK meet the requirements and function as expected?
2. Code Quality: Is your code clean, maintainable, and well-structured? Does it follow best practices for the chosen programming language?
3. Documentation: Is the README file clear and comprehensive? Can other developers easily integrate and use your SDK?

**Submission:**

Before you start the solution, it would be preferable to create your solution branch, from the main branch.
When you are ready, open a Pull Request against the main branch of your GitHub repository.
Include any instructions or prerequisites required for setting up and testing your SDK.

Best of luck!
