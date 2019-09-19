unit Draw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Buttons, Menus;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    ColorDialog1: TColorDialog;
    MainMenu1: TMainMenu;
    MiniPaint1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  g_isDraw: Boolean = False;

implementation

{$R *.dfm}

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  g_isDraw := True;
  Canvas.MoveTo(X,Y);
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if g_isDraw then
    begin
      Canvas.LineTo(X,Y);
      Canvas.MoveTo(X,Y);
    end;
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  g_isDraw := False;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    Canvas.Pen.Color := ColorDialog1.Color;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  { Clear all }
  Repaint;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  { Close application }
  Close;
end;

end.
