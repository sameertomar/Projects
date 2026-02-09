How to Run the Project

Install Requirements Make sure you have Python 3.8+ installed. Then, install all dependencies: pip install -r requirements.txt
You also need to have Ollama installed and running locally to use the Llama 3.1 model. 3. Start the Chatbot Run the Streamlit app: streamlit run app.py

This will open a web page where you can upload a PDF and ask questions.

Project Architecture & Flow PDF is uploaded via Streamlit UI. PDF is split into text chunks (chunk.py). Chunks are embedded using a HuggingFace model and stored in a FAISS vector database (embedding_code.py). User query is matched to relevant chunks using mmr search.

Steps to Run Preprocessing, Create Embeddings, and Build the RAG Pipeline The user does NOT need to run preprocessing or embedding scripts manually. Instead, when a PDF is uploaded and a query is asked in the Streamlit app, the code automatically: Splits the PDF into chunks. Creates embeddings for those chunks. Builds/updates the FAISS vector database. Retrieves relevant chunks and generates an answer.

Model & Embedding Choices Embeddings: all-MiniLM-L6-v2 from HuggingFace. LLM: Llama 3.1 via Ollama.

Instructions to Run the Chatbot with Streaming Response Enabled The Streamlit app provides a simple interface. The user uploads a PDF, enters a query, and clicks "Ask". The response is shown in the app, along with the source documents. (Note: Your current code does not implement true token-by-token streaming from the LLM, but the UI does show a spinner while processing and then displays the full answer.)

Project Architecture & Flow (overview)

Upload PDF: You upload a PDF file using a web interface (Streamlit). Chunking: The PDF is split into smaller text chunks. Embeddings: Each chunk is converted into a vector (embedding) using a HuggingFace model. Vector Database: All embeddings are stored in a FAISS vector database for fast searching. Query: When you ask a question, the system finds the most relevant chunks from your document. Answer Generation: The Llama 3.1 language model (via Ollama) generates an answer using only the retrieved chunks as context. Display: The answer and the source chunks are shown in the web app.

