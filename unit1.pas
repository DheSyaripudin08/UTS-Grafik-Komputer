unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonAtapColor: TButton;
    ButtonDindingColor: TButton;
    ButtonPintuColor: TButton;
    ButtonJendelaColor: TButton;
    ButtonScaleUp: TButton;
    ButtonScaleDown: TButton;
    ButtonMoveLeft: TButton;
    ButtonMoveRight: TButton;
    ColorDialog1: TColorDialog;
    PaintBox1: TPaintBox;
    procedure ButtonAtapColorClick(Sender: TObject);
    procedure ButtonDindingColorClick(Sender: TObject);
    procedure ButtonJendelaColorClick(Sender: TObject);
    procedure ButtonJendelaColorClickClick(Sender: TObject);
    procedure ButtonMoveLeftClick(Sender: TObject);
    procedure ButtonMoveLeftClickClick(Sender: TObject);
    procedure ButtonMoveRightClick(Sender: TObject);
    procedure ButtonMoveRightClickClick(Sender: TObject);
    procedure ButtonPintuColorClick(Sender: TObject);
    procedure ButtonPintuColorClickClick(Sender: TObject);
    procedure ButtonScaleDownClick(Sender: TObject);
    procedure ButtonScaleDownClickClick(Sender: TObject);
    procedure ButtonScaleUpClick(Sender: TObject);
    procedure ButtonScaleUpClickClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
  private
    { private declarations }
    DindingColor, AtapColor, PintuColor, JendelaColor: TColor;
    ScaleFactor: Double;
    PosX: Integer;

  public
    { public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Inisialisasi warna dan skala awal rumah
  DindingColor := clGray;
  AtapColor := clRed;
  PintuColor := clGreen;
  JendelaColor := clBlue;
  ScaleFactor := 1.0;
  PosX := 100;  // Posisi X awal rumah

  // Memaksa menggambar rumah saat form pertama kali dibuat
  PaintBox1.Invalidate;

  PosX := 50;  // Memastikan rumah muncul lebih di tengah layar

end;

procedure TForm1.PaintBox1Click(Sender: TObject);
begin

end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
  x, y, w, h: Integer;
begin
  // Bersihkan canvas terlebih dahulu dengan warna latar default
  PaintBox1.Canvas.Brush.Color := clWhite; // Pilih warna latar (misalnya putih)
  PaintBox1.Canvas.FillRect(PaintBox1.ClientRect);

  // Ukuran rumah berdasarkan faktor skala
  w := Round(100 * ScaleFactor);  // Lebar dinding
  h := Round(100 * ScaleFactor);  // Tinggi dinding
  x := PosX;  // Posisi X (horizontal) rumah
  y := 150;   // Posisi Y (vertikal) rumah

  // Menggambar dinding rumah (persegi panjang)
  PaintBox1.Canvas.Brush.Color := DindingColor;
  PaintBox1.Canvas.Rectangle(x, y, x + w, y + h);

  // Menggambar atap rumah (segitiga)
  PaintBox1.Canvas.Brush.Color := AtapColor;
  PaintBox1.Canvas.Polygon([
    Point(x, y),                // Kiri bawah
    Point(x + w div 2, y - 50), // Puncak segitiga (tengah atas)
    Point(x + w, y)             // Kanan bawah
  ]);

  // Menggambar pintu rumah (persegi panjang kecil)
  PaintBox1.Canvas.Brush.Color := PintuColor;
  PaintBox1.Canvas.Rectangle(x + w div 3, y + h div 2, x + w div 3 * 2, y + h);

  // Menggambar jendela rumah (lingkaran)
  PaintBox1.Canvas.Brush.Color := JendelaColor;
  PaintBox1.Canvas.Ellipse(x + w div 10, y + h div 4, x + w div 3, y + h div 2);
end;

procedure TForm1.ButtonDindingColorClick(Sender: TObject);
begin
  // Mengubah warna dinding
  if ColorDialog1.Execute then
  DindingColor := ColorDialog1.Color;
  PaintBox1.Invalidate; // Refresh gambar
end;

procedure TForm1.ButtonJendelaColorClick(Sender: TObject);
begin

end;

procedure TForm1.ButtonJendelaColorClickClick(Sender: TObject);
begin
  // Mengubah warna jendela
    if ColorDialog1.Execute then
    JendelaColor := ColorDialog1.Color;
    PaintBox1.Invalidate;
end;

procedure TForm1.ButtonMoveLeftClick(Sender: TObject);
begin

end;

procedure TForm1.ButtonMoveLeftClickClick(Sender: TObject);
begin
    // Menggeser rumah ke kiri
      PosX := PosX - 10;
      PaintBox1.Invalidate;
end;

procedure TForm1.ButtonMoveRightClick(Sender: TObject);
begin

end;

procedure TForm1.ButtonMoveRightClickClick(Sender: TObject);
begin
    // Menggeser rumah ke kanan
      PosX := PosX + 10;
      PaintBox1.Invalidate;
end;

procedure TForm1.ButtonPintuColorClick(Sender: TObject);
begin

end;

procedure TForm1.ButtonPintuColorClickClick(Sender: TObject);
begin
  // Mengubah warna pintu
    if ColorDialog1.Execute then
    PintuColor := ColorDialog1.Color;
    PaintBox1.Invalidate;
end;

procedure TForm1.ButtonScaleDownClick(Sender: TObject);
begin

end;

procedure TForm1.ButtonScaleDownClickClick(Sender: TObject);
begin
    // Memperkecil skala rumah
      ScaleFactor := ScaleFactor - 0.1;
      if ScaleFactor < 0.1 then ScaleFactor := 0.1;  // Pastikan skala minimal
      PaintBox1.Invalidate;
end;

procedure TForm1.ButtonScaleUpClick(Sender: TObject);
begin

end;

procedure TForm1.ButtonScaleUpClickClick(Sender: TObject);
begin
  // Memperbesar skala rumah
    ScaleFactor := ScaleFactor + 0.1;
    PaintBox1.Invalidate; // Refresh gambar
end;

procedure TForm1.ButtonAtapColorClick(Sender: TObject);
begin
  // Mengubah warna atap
  if ColorDialog1.Execute then
  AtapColor := ColorDialog1.Color;
  PaintBox1.Invalidate;
end;

end.

