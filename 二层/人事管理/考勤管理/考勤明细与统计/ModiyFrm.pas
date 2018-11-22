unit ModiyFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrlsEh, DMFrm, ADODB;

type
  TfrmModify = class(TForm)
    btn1: TButton;
    btn2: TButton;
    lbl1: TLabel;
    cbb1: TComboBox;
    ads1: TADODataSet;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitFrm(ASql: string);
  end;

implementation

{$R *.dfm}

{ TfrmModify }

procedure TfrmModify.InitFrm(ASql: string);
begin
  cbb1.Clear;
  ads1.Close;
  ads1.CommandText := ASql;
  ads1.Open;
  ads1.First;
  while not ads1.Eof do
  begin
    cbb1.AddItem(ads1.fieldbyname('DisplayText').AsString,Pointer(ads1.FieldByName('rkey').AsInteger));
    ads1.Next;
  end;
end;

procedure TfrmModify.btn1Click(Sender: TObject);
begin
  if cbb1.ItemIndex = -1 then
  begin
    ShowMessage('ÇëÖØÐÂÑ¡Ôñ');
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
