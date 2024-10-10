from textSummarizer.config.configuration import ConfigurationManager
from transformers import AutoTokenizer
from transformers import pipeline

class PredictPipeline:
    def __init__(self):
        self.cofig = ConfigurationManager().get_model_evaluation_config()
        
    def predict(self,text):
        #Prediction
        
        tokenizer = AutoTokenizer.from_pretrained(self.config.tokenizer_path)

        gen_kwargs = {"length_penalty": 0.8, "num_beams":8, "max_length": 128}


        pipe = pipeline("summarization", model=self.cofig.model_path ,tokenizer=tokenizer)

        ##
        print("Dialogue:")
        print(text)
        
        output = pipe(text,**gen_kwargs)[0]['summary_text']
        print("\nMode Summary:")
        print(output)
        
        return output


         