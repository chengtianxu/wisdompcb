unit ufrmClose;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmClose = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Timer1: TTimer;
    Label3: TLabel;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    vearly_ptrvalue:integer;
    function Get_vearly_ptrvalue: integer;
  public
    { Public declarations }
    property early_ptrvalue:integer read Get_vearly_ptrvalue;
  end;

var
  frmClose: TfrmClose;

implementation

uses uMain, uDM,findUnit2;

{$R *.dfm}

procedure TfrmClose.FormShow(Sender: TObject);
begin
 dm.QeryDate.Close;
 dm.QeryDate.Open;
 Datetimepicker1.Date :=dm.QeryDatevd.Value;

 if dm.wzpr444_7.Active then dm.wzpr444_7.Close;
 dm.wzpr444_7.Open;
 dm.wzpr444_7.Open;
 edit2.Text := dm.wzpr444_7cut_date.AsString ;
 vearly_ptrvalue := dm.wzpr444_7rkey.Value;
 dm.wzpr444_7.Close;
end;

procedure TfrmClose.BitBtn1Click(Sender: TObject);
begin
 modalresult:=mrok;
end;

procedure TfrmClose.Timer1Timer(Sender: TObject);
begin
 Edit1.Text :=Frmmain.StatusBar1.Panels[1].text;
end;

function TfrmClose.Get_vearly_ptrvalue: integer;
begin
  result := vearly_ptrvalue;
end;

procedure TfrmClose.BitBtn3Click(Sender: TObject);
begin
    findForm4 := TfindForm4.Create(application) ;
    try
      findForm4.Caption := '≤È’“Ωÿ ±º‰';
      if findForm4.ADOStoredProc1.Active then
        findForm4.ADOStoredProc1.Close;
      findForm4.ADOStoredProc1.Open;
      if findForm4.ShowModal = mrOK then
        begin
          vearly_ptrvalue := findForm4.ADOStoredProc1rkey.Value  ;
          edit2.Text := findForm4.ADOStoredProc1cut_date.AsString;
        end;
    finally
      findForm4.Free;
    end;
end;

end.
