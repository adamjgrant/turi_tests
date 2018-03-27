import turicreate as tc

# Load data
data = tc.SFrame('wine.csv')

# Create a model
model = tc.sentence_classifier.create(data, 'points', features=['description'])

# Make predictions & evaluation the model
predictions = model.predict(data)
results = model.evaluate(data)

# Save the model for later use in Turi Create
model.save('MySentenceClassifier.model')
