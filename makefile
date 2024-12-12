MARKDOWN_FILES = md/introduction.md \
	md/command_line.md \
	md/package_managers.md \
	md/conf_languages.md \
	md/build_automation.md \
	md/version_control.md \
	md/docs_as_code.md \
	md/virtual_machines.md \
	md/bibliography.md     # Список markdown файлов

OUTPUT_PDF = output.pdf		# Имя выходного PDF файла
BIB_FILE = bibliography.bib

FONT_NAME = "Times New Roman"
FONT_SIZE = 14pt
MARGIN = "margin=2cm"

PANDOC_OPTIONS = --pdf-engine=xelatex \
				-d settings.yaml \
				--resource-path=img \
				-F pandoc-crossref \
				--citeproc \
				--bibliography=$(BIB_FILE) \
				--csl=gost-r-7-0-5-2008-numeric-iaa.csl \
				--variable mainfont=$(FONT_NAME) \
				--variable fontsize=$(FONT_SIZE) \
				--variable geometry=$(MARGIN)

# -d settings.yaml - для указания файла конфигурации
# --toc - создать оглавление
# -N - включить нумерацию секций
# --citeproc - процессор для создания библиографии на цитировании
# -F pandoc-crossref - для работы пандока с ссылками на картинки, таблицы, файлы итп
# rsvg-convert - позволяет преобразовывать SVG-файлы в различные растровые форматы изображений: PNG, JPEG, и другие.

# Правило по умолчанию
all: $(OUTPUT_PDF)

# Команда для создания PDF из Markdown
$(OUTPUT_PDF): $(MARKDOWN_FILES) $(BIB_FILE)
	pandoc $(PANDOC_OPTIONS) --toc -N -o $@ $(MARKDOWN_FILES) 

# Правило для очистки
clean:
	rm -f $(OUTPUT_PDF)