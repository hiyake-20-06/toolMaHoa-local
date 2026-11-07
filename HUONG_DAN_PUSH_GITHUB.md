# Huong dan phat hanh len GitHub

Repo hien tai: https://github.com/hiyake-20-06/toolMaHoa-local

## 1. Push thay doi

```powershell
git add -A
git commit -m "Mo ta thay doi"
git push
```

## 2. Tao file zip phat hanh

```powershell
.\make-release.ps1
```

File duoc tao tai:

```
release\ToolMaHoa-v1.0.0-win64.zip
```

Zip gom: `ToolMaHoa/ToolMaHoa.exe`, `ToolMaHoa/_internal/`, `ToolMaHoa/README.md`.

Thu muc `release/` da nam trong `.gitignore` nen zip **khong** bi commit vao repo.
Chi upload file nay len GitHub Releases.

## 3. Tao Release tren GitHub

### Cach 1: giao dien web

1. Vao repo > **Releases** > **Draft a new release**
2. **Choose a tag** > go `v1.0.0` > **Create new tag**
3. Dat tieu de, vi du `Tool Ma Hoa v1.0.0`
4. Keo file `release\ToolMaHoa-v1.0.0-win64.zip` vao muc **Attach binaries**
5. Bam **Publish release**

### Cach 2: GitHub CLI (neu da cai `gh`)

```powershell
gh release create v1.0.0 "release\ToolMaHoa-v1.0.0-win64.zip" `
  --title "Tool Ma Hoa v1.0.0" `
  --notes "Ban build san cho Windows 64-bit"
```

## Luu y

- Neu GitHub hoi dang nhap, dung Personal Access Token (PAT) thay cho mat khau.
- Kiem tra remote:
  ```powershell
  git remote -v
  ```
- File `ToolMaHoa.exe` va cac DLL trong `_internal` la binary, da khai bao trong `.gitattributes`.
- Moi lan ra ban moi, doi `-Version` khi tao zip:
  ```powershell
  .\make-release.ps1 -Version 1.0.1
  ```
