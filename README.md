# Tool Ma Hoa (Crypto Toolkit)

Cong cu truc quan hoa ma hoa co dien — ho tro nhieu loai ma, giai thich tung buoc va chuc nang crack.

Ban build san cho Windows, **khong can cai Python**.

## Tai va chay (Windows)

**Cach 1 — Tai file ZIP phat hanh (de nhat):**

1. Vao trang Releases: https://github.com/hiyake-20-06/toolMaHoa-local/releases
2. Tai file `ToolMaHoa-v1.0.0-win64.zip` moi nhat.
3. Giai nen ra mot thu muc.
4. Giu nguyen `ToolMaHoa.exe` va thu muc `_internal` nam canh nhau, roi double-click `ToolMaHoa.exe`.

**Cach 2 — Clone repo:**

```bash
git clone https://github.com/hiyake-20-06/toolMaHoa-local.git
cd toolMaHoa-local
```

Hoac tai truc tiep: https://github.com/hiyake-20-06/toolMaHoa-local/archive/refs/heads/main.zip

Sau do mo `ToolMaHoa.exe` trong thu muc vua tai.

> Luu y: Windows SmartScreen hoac antivirus co the canh bao vi file EXE khong duoc ky so.
> Chon **More info > Run anyway** (hoac **Allow**) de tiep tuc.

## Cau truc thu muc

```
ToolMaHoa/
├─ ToolMaHoa.exe       # chuong trinh chinh (GUI)
├─ _internal/          # runtime Python + Tk, BAT BUOC phai giu
├─ make-release.ps1    # tao file zip de phat hanh
├─ release/            # chua file zip phat hanh (khong commit)
├─ README.md
├─ .gitignore
└─ .gitattributes
```

Khong duoc di chuyen `ToolMaHoa.exe` ra khoi thu muc hoac xoa `_internal`, neu khong tool se khong chay.

## Dong goi ban phat hanh (Release)

Tao file zip gom `ToolMaHoa.exe` + `_internal` + `README.md`:

```powershell
.\make-release.ps1
```

Ket qua: `release\ToolMaHoa-v1.0.0-win64.zip`.

De phat hanh tren GitHub: vao **Releases > Draft a new release**, tao tag (vi du `v1.0.0`)
va upload file zip vua tao. Thu muc `release/` da duoc bo qua trong `.gitignore`,
nen file zip khong bi commit vao repo.

## Cac he ma ho tro

| Ma | Cong thuc / Nguyen ly |
|---|---|
| Affine | E(x) = (a*x + b) mod 26 |
| Thay the (Substitution) | Bang 26 chu cai tuy y |
| Caesar | E(x) = (x + shift) mod 26 |
| Vigenere | E(x) = (x + k[i]) mod 26, tu khoa lap lai |
| Playfair | Bang 5x5, ma hoa tung cap ky tu |
| Hill | [y] = K * [x] mod 26 (ma tran 2x2) |

## Tinh nang

- **Danh muc co dien / nang cao**: dropdown "Co dien" (Affine, Thay the, Caesar) va "Nang cao" (Vigenere, Playfair, Hill) — moi muc la 1 menu xo xuong
- **Noi dung giai thich tung buoc**: bai toan + cach tinh tung ky tu + ket qua o 1 o lon
- **Nut Huong dan** cho tung loai ma (phim F1 / menu Huong dan)
- **Cai dat**: doi giao dien sang/toi thoi diem, About ghi ro quyen tac gia
- **Brute-force**: Affine (312 khoa) va Caesar (25 shift) voi goi y chi-square
- **Do tep tin**: mo tep `.txt` vao van ban dau vao, xuat bai toan + giai thich ra tep
- **Sao chep vao clipboard**
- **Bo dau tieng Viet**: chuyen "chao" thanh "chao" truoc khi ma hoa
- **Phan tich tan suat**: dem tan so ky tu trong ban ma, goi y e/t
- **Tao key ngau nhien** cho ma Thay the
- **Chi-square**: Caesar brute-force tu dong goi y shift dung nhat

## Yeu cau

- Windows 10/11 (64-bit)
- Khong can Python hay thu vien nao khac

## Ghi chu

- Repo nay luu **ban build san** de tai va chay ngay.
- Ma nguon khong nam trong repo nay.
