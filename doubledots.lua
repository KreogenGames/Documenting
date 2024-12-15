function Caption(el)
	print("Обрабатываем подпись: " .. el.text)
    if el.text:match("^(Рис%. %d+):") then
        el.text = el.text:gsub(":", "")
    elseif el.text:match("^(Таблица %d+):") then
        el.text = el.text:gsub(":", "")
    end
    return el
end