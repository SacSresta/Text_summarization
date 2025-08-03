# 📝 Text Summarization with PEGASUS and FastAPI

This project implements an end-to-end pipeline for abstractive text summarization using Google's PEGASUS model. It includes modular stages for data processing, model training, evaluation, and a FastAPI-based deployment server for real-time summarization.

---

## 🚀 Features

- Modular pipeline: ingestion → validation → transformation → training → evaluation
- PEGASUS model from Hugging Face (`google/pegasus-xsum`)
- Real-time summarization API with FastAPI
- Clean folder structure using configuration files
- ROUGE metrics for evaluation

---

## 📁 Project Structure

```
Text_summarization/
├── artifacts/                     # Output files from each pipeline stage
├── config/                        # YAML configs
├── data/                          # Input datasets
├── notebooks/                     # Experimental notebooks
├── src/
│   └── textSummarizer/
│       ├── components/            # Core logic for each stage
│       ├── config/                # Configuration dataclasses
│       ├── pipeline/              # Pipeline entry scripts (stage_01 → stage_05)
│       ├── utils/                 # Helper functions
├── app.py                         # FastAPI app
├── main.py                        # Runs all stages in order
├── requirements.txt
└── README.md
```

---

## 🔧 Setup Instructions

### 1. Clone the repo

```bash
git clone https://github.com/yourusername/Text_summarization.git
cd Text_summarization
```

### 2. Create and activate a virtual environment

```bash
python -m venv venv
source venv/bin/activate           # Windows: venv\Scripts\activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

---

## 🧪 Running the Pipeline

Run the complete pipeline:

```bash
python main.py
```

Or run individual stages manually:

```bash
python src/textSummarizer/pipeline/stage_01_data_ingestion.py
python src/textSummarizer/pipeline/stage_02_data_validation.py
python src/textSummarizer/pipeline/stage_03_data_transformation.py
python src/textSummarizer/pipeline/stage_04_model_trainer.py
python src/textSummarizer/pipeline/stage_05_model_evaluation.py
```

Output artifacts and logs will be saved in the `artifacts/` folder.

---

## 🌐 Deploy the FastAPI App

Launch the FastAPI server with:

```bash
uvicorn app:app --reload
```

Go to `http://127.0.0.1:8000/docs` to access Swagger UI and test the summarization endpoint.

---

## 🔍 Example API Usage

**POST** `/summarize`

**Payload**:

```json
{
  "text": "Your long article or document here..."
}
```

**Response**:

```json
{
  "summary": "Shortened version of the input text."
}
```

---

## 🤖 Model Used

- **PEGASUS-XSUM**
  - Source: [`google/pegasus-xsum`](https://huggingface.co/google/pegasus-xsum)
  - Optimized for abstractive summarization on short news articles.

---

## 📊 Evaluation Metrics

The model is evaluated using:

- ROUGE-1
- ROUGE-2
- ROUGE-L

These metrics compare the model-generated summary with reference (ground truth) summaries.

---

## 📌 TODO

- [ ] Add support for different summarization models
- [ ] Improve preprocessing for noisy datasets
- [ ] Add CLI support
- [ ] Add logging and exception handling
- [ ] Add tests and CI/CD

---

## 🤝 Contributing

Contributions are welcome! Please fork the repo, open issues, and submit pull requests. Let's improve this together.

---

## 📄 License

MIT License. Feel free to use this project in commercial and non-commercial applications.

---
