# Huong dan dua repo len GitHub

Repo da duoc commit san o nhanh `main`. Ban chi can tao repo tren GitHub roi push.

## 1. Tao repo tren GitHub

- Vao https://github.com/new
- Dat ten repo, vi du: `ToolMaHoa`
- **Khong** tick "Add a README file", "Add .gitignore", "Choose a license" (repo da co san)
- Bam **Create repository**

## 2. Them remote va push

Mo PowerShell tai thu muc nay (`D:\push-githud\project-1\ToolMaHoa`) va chay:

```powershell
git remote add origin https://github.com/<username>/ToolMaHoa.git
git branch -M main
git push -u origin main
```

Thay `<username>` bang tai khoan GitHub cua ban.

## 3. Neu dung GitHub CLI (tien hon)

```powershell
gh repo create ToolMaHoa --public --source . --remote origin --push
```

## Luu y

- Neu GitHub hoi dang nhap, dung Personal Access Token (PAT) thay cho mat khau.
- Kiem tra remote hien tai:
  ```powershell
  git remote -v
  ```
- Doi remote neu nhap sai:
  ```powershell
  git remote set-url origin https://github.com/<username>/ToolMaHoa.git
  ```
- File `ToolMaHoa.exe` va cac DLL trong `_internal` la file binary, da duoc khai bao trong `.gitattributes`.
