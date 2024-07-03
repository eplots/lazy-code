import markdown
from weasyprint import HTML, CSS
import sys
import re
from datetime import datetime

def extract_date(markdown_text):
    # Försök att hitta ett datum i formatet "Datum: YYYY-MM-DD"
    match = re.search(r'\*\*Datum\*\*:\s*(\d{4}-\d{2}-\d{2})', markdown_text)
    return match.group(1) if match else datetime.now().strftime('%Y-%m-%d')

def markdown_to_pdf(input_file, output_file):
    # Läs markdown från fil
    with open(input_file, 'r', encoding='utf-8') as file:
        markdown_text = file.read()

    # Extrahera datumet
    date = extract_date(markdown_text)

    # Konvertera markdown till HTML
    html_text = markdown.markdown(markdown_text, extensions=['tables'])

    # HTML-mall med anpassad teckenstorlek
    html_template = f"""
    <html>
    <head>
    <style>
        @page {{
            size: A4;
            margin: 30mm 20mm 30mm 20mm; /* Top, Right, Bottom, Left margins */
        }}
        body {{
            font-family: 'Arial';
            padding: 13.2px;
            font-size: 11px; /* Standardstorlek för brödtext */
        }}
        h1 {{
            font-size: 24px; /* Storlek för H1 rubriker */
            color: #e47203;
        }}
        h2 {{
            font-size: 20px; /* Storlek för H2 rubriker */
            color: #2b979f;
        }}
        h3 {{
            font-size: 16px; /* Storlek för H3 rubriker */
            color: #000000;
        }}
        #header {{
            position: fixed;
            left: -10mm;
            top: -20mm;
            text-align: left;
        }}
        #header img {{
            width: 52.5mm;
            height: auto;
            opacity: 0.5;
        }}
        #date {{
            position: fixed;
            right: -10mm;
            top: -20mm;
            font-size: 7px;
            opacity: 0.5;
        }}
        #date .label {{
            color: orange;
        }}
        #date .value {{
            color: black;
        }}
        ul, ol {{
            padding-left: 20px; /* Justera detta värde för att kontrollera indraget för hela listan */
        }}
        ul ul, ol ol {{
            padding-left: 10px; /* Justera detta värde för att kontrollera indraget för nestlade listor */
        }}
        li {{
            margin-bottom: 3px; /* Ger ett litet mellanrum mellan listpunkter */
        }}
        }}
        table {{
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px; /* Lägg till utrymme under tabellerna */
        }}
        th, td {{
            border: 1px solid #ddd; /* Lätt grå kantlinje */
            padding: 8px; /* Tillräckligt med utrymme för cellinnehållet */
            text-align: left; /* Vänsterjustera all text i cellerna */
        }}
        th {{
            background-color: #f2f2f2; /* Ljusgrå bakgrundsfärg för rubriker */
            font-weight: bold;
        }}
    </style>
    </head>
    <body>
    <div id='header'>
        <img src='https://www.kfast.se/wp-content/themes/kfast-theme%201.0.1.3.6/images/KFast_Logotype_webb@2x.png'>
    </div>
    <div id='date'>
        {f'<span class="label">DATUM:</span> <span class="value">{date}</span>' if date else ""} <br>
        Eskilstuna Kommunfastigheter AB
    </div>
    {html_text}
    </body>
    </html>
    """

    # Generera PDF
    html = HTML(string=html_template)
    html.write_pdf(output_file)

    print(f"PDF-filen {output_file} har skapats.")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Användning: python script.py input.md output.pdf")
    else:
        input_filepath = sys.argv[1]
        output_filepath = sys.argv[2]
        markdown_to_pdf(input_filepath, output_filepath)
