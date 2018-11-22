unit uBaseFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmBase = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    FModID: Integer;
  end;

implementation

{$R *.dfm}

end.
