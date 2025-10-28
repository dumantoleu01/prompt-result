# GitHub Setup Guide

## Проект готов к загрузке на GitHub! ✅

Все изменения закоммичены. Следуйте инструкциям ниже:

---

## Вариант 1: Создание репозитория через веб-интерфейс (рекомендуется)

### Шаг 1: Создайте репозиторий на GitHub
1. Откройте https://github.com/new
2. Введите название репозитория: `ai-image-generator-flutter` (или любое другое)
3. Выберите Public или Private
4. **НЕ добавляйте** README, .gitignore или license (они уже есть в проекте)
5. Нажмите **"Create repository"**

### Шаг 2: Загрузите код (выполните в терминале)

После создания репозитория GitHub покажет вам URL. Используйте команды ниже:

```bash
cd /Users/duman/Flutter/work2/prompt_result

# Добавьте remote (замените YOUR_USERNAME на ваш GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/ai-image-generator-flutter.git

# Или используйте SSH (если настроен):
# git remote add origin git@github.com:YOUR_USERNAME/ai-image-generator-flutter.git

# Переименуйте ветку dev в main (опционально)
git branch -M main

# Загрузите код на GitHub
git push -u origin main
```

---

## Вариант 2: Быстрая загрузка через GitHub CLI

Если у вас установлен GitHub CLI:

```bash
cd /Users/duman/Flutter/work2/prompt_result

# Создайте репозиторий и загрузите код одной командой
gh repo create ai-image-generator-flutter --public --source=. --push

# Или для приватного репозитория:
# gh repo create ai-image-generator-flutter --private --source=. --push
```

---

## После загрузки

Ваш репозиторий будет доступен по адресу:
```
https://github.com/YOUR_USERNAME/ai-image-generator-flutter
```

### Что включено в репозиторий:

✅ Полный исходный код приложения
✅ Clean Architecture структура
✅ flutter_bloc state management
✅ go_router navigation
✅ Переиспользуемые UI компоненты
✅ Документация (README, PROJECT_OVERVIEW, и др.)
✅ Тесты
✅ Assets (изображения)
✅ .gitignore файл

---

## Полезные команды Git

```bash
# Проверить статус
git status

# Посмотреть историю коммитов
git log --oneline

# Посмотреть remote репозитории
git remote -v

# Удалить remote (если нужно изменить)
git remote remove origin

# Загрузить изменения после первого push
git push
```

---

## Настройка README.md на GitHub

После загрузки обновите README.md, добавив:
- Screenshot приложения
- Badges (build status, license)
- Ссылки на документацию
- Инструкции для других разработчиков

---

## Проблемы?

### Ошибка: "remote origin already exists"
```bash
git remote remove origin
# Затем добавьте снова
```

### Ошибка аутентификации
Используйте Personal Access Token вместо пароля:
1. GitHub → Settings → Developer settings → Personal access tokens
2. Generate new token (classic)
3. Используйте token как пароль при push

---

**Готово!** 🎉 Ваш проект теперь на GitHub!

