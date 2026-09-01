+++
title = 'The Great AI Experiment: Can An AI Agent Replace Data Science?'
date = 2026-09-01T12:29:01-07:00
draft = false
+++

I've been fairly used to using AI for support when coding as I've documented on this page before. But one thing I haven't treaded into to deep is AI agents. I've used it a bit within Visual Studio, but not for any one-shot tasks, which refers to giving an AI agent a task and sending it off to complete it. One often cited use case for agentic workflows is in areas where the user does not have experience, or is only marginally familiar. I'm trying to dig more into machine learning with Python, so that seemed like a good case to try it on.

# The task: Analyze chest x-rays to detect pneumonia
I tried to find a large enough database such that it would have some difficulty grasping it. In prior testing, CSV formatted data is relatively easy to be parsed and analyze. In order to find a greater challenge, I wanted something that required images instead. I found this dataset on Kaggle that documented [chest X-rays for child patients in China](https://www.kaggle.com/datasets/paultimothymooney/chest-xray-pneumonia/data). It seemed to be a popular dataset, with a variety of notebooks that analyzed it. This would provide a helpful point of comparison to grade the performance of the AI agent later.

# The first attempt
Using Github Copilot, I setup the data in a repository, and requested that Copilot CLI would create an agent to analyze the data and provide me with the output I wanted. This "agent" was simply a markdown file that had expanded on my request. This is a good idea in principle, as most user requests are quite vague and unclear. On the backend, I imagine this is simply "Clarify the users request and make a markdown document that is properly formatted", but it also locks in several assumptions. For my request, that merely asked it to train a model on the data, it specified that it should use ResNet50, VGG16, or EfficientNet. It also locked in on several things, like suggesting resizing every image to 224px by 224px. 

After the agent file was created, I provided it the directory and let it run wild basically, only coming back to press 1 on the keyboard to let it continue. I started it in the morning and after about 20 minutes, it finished my prompt, returning a Jupyter notebook that contained all of the information I requested. It chose to use MobileNetV2 as it had determined that my computer did not have a GPU to use. I am not sure why it could not find my GPU, but who am I to question our robot overlords? In reality, this seems to be due to the fact that Tensorflow no longer supports Windows GPUs, instead requiring you to use WSL to get around it, but the agent could not determine that or tell me of this constraint.

The data contained training, validation and testing data. Generally, you use training data to train the model, use validation data to evaluate the quality of the trained model for comparison, and then save the testing data for the end. However, due to a peculiarity of this dataset, the validation data contained only 16 images, 8 normal and 8 bacterial pneumonia cases. However, the training data contained both bacterial and viral pneumonia images, which broke the agent a bit. It decided to throw out the validation data essentially, and split the training data so that it had a separate validation set. This reduced the total training data available, and was consistent throughout the rest of the iterations I did.

# Second try: CNN
From my peak behind the curtains, I heard that raw convolutional neural networks were more suited to this task. So I set my agent about to try that approach. It provided sets of Conv-Batch Norm-ReLU-MaxPool blocks with increasing filter depth, and after 25 epochs it returned worse results than first try, producing 78% accuracy instead of the firsts 82%. 

Before we proceed, we need to discuss a couple limitations of what the AI was doing. Because the data contained 3 types, it assumed I cared about classifying between bacterial and viral pneumonia. Medically of course, this distinction matters, as giving someone with viral pneumonia antibiotics won't help them. For this case, I'm not a doctor, I just want to play. It would not address this issue until much later. The problem for the model is that training 3-wise classification is much harder than binary classification, simply because you have more classifications to give out, especially in this case where bacterial and viral may look similar.

# Third try and beyond: Let it run wild
At this point, I was a little tired of baby sitting it, and wanted it to give it a little more control. So I requested that my agent iterate until it reached 90% accuracy, which I knew to be feasible as several [Kaggle models](https://www.kaggle.com/code/madz2000/pneumonia-detection-using-cnn-92-6-accuracy) could achieve that on this dataset. I won't delve too deeply into the differences but I'll cover the highlights as follows.

## Third try
I said before that the agent specified it should use 224px resolution, but this was ignored by the first attempts, so it finally used that here. Additionally, it tried to fine tune everything about the MobileNetV2 model rather than just the last 30 layers and other further improvements that boiled down to "just do more work". This strategy significantly worsened test accuracy unfortunately.

## Fourth try
Now it only wanted to unfreeze the last 50 layers instead of 30. It also used checkpointing to help improve training. This gave better accuracy, but only up to 78%, which is what the original model got.

## Fifth try
It finally tried something else, switching to EfficientNet instead and attempted to keep all the changes it thought were helpful. This got slightly under 78% accuracy. 

## Sixth try
Now it threw out the resolution increase, going back to 160px and went back to MobileNetV2 and increased training time. This is when I noticed it took a lot longer to execute. At the end, it had 81.6% accuracy, which is much better than the rest of the tries, if you exclude it's first attempt.

## Seventh try
Finally, at this point, it started trying to do binary classification instead, which should help it. This gave it it's best accuracy yet, but not nearly to my goal of 90%. 

## Eighth and Ninth tries
These attempts were mostly nitpicks, retrying 224px resolution and unfreezing more layers. By the end, it got to 88 percent accuracy nearly, which is quite good.

# Could AI beat Kaggle?
By the end, my AI agent could not beat the great wisdom of the Kaggle community. My goal was 90%, but in truth the specific notebook I was comparing to was actually getting 92% accuracy. While 88% to 92% may not sound like much, as we know from Walter White in Breaking Bad, purity is everything, and the gap is truly vast. So what did the notebook I was comparing to do differently?

1. Use the validation dataset properly.
2. Scale the so it's normalized to 0-1 instead of to 255, which helps the algorithm.
3. Use data augmentation to add more training data. One key point that context provides us is that generally healthy people do not get chest X-rays, and as such there is significantly more pneumonia cases than normal cases in the data. Adding further modifications of the training data provides valuable insights that helps balance out the datasets better.
4. Using binary classification properly. Even while the agent learned that I didn't care about classifying bacterial versus viral pneumonia, it didn't actually use the validation data. 

While I'm sure the models have been trained on data augmentation, it requires a bit more knowledge to properly train a model in this case. I would classify the data augmentation as the most likely thing that influenced Kaggles improvement over my agent, but it didn't think to look into it. 

# Did AI provide me a decent model without much work?
Absolutely! I spent most of the day doing other things, only occasionally coming back to enable it. While I started in the morning and ended around 6pm, it probably would've taken me about 2-3 hours of work to do the same starting on my own, but that would be time spent at a computer, and not working on other things. Overall, this little experiment cost 1067 tokens, roughly 10 bucks, so I would say it was worth it.
