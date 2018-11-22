unit PasSelTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh;

type
  TfrmSelTime = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    dbSelTime: TDBGridEh;
    procedure dbSelTimeDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    sqlstr:string;
    { Private declarations }
  public
    employrkey:Integer;
    expRkey,traindate,inRkey:string;
    { Public declarations }
  end;

var
  frmSelTime: TfrmSelTime;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmSelTime.dbSelTimeDblClick(Sender: TObject);
begin
  ModalResult:=mrYes;
end;

procedure TfrmSelTime.FormShow(Sender: TObject);
begin
  with DM.adoSelTime do
  begin
    sqlstr:=CommandText;
    Close;
    CommandText:=sqlstr+ ' and dbo.Employee_Train_eastid.employeeid= '+ IntToStr(employrkey)+ #13+
                         ' and Employee_Train_eastid.card_date= '+ QuotedStr(traindate)+#13+
                         ' and ((Employee_Train_eastid.rkey not in ('+ expRkey+') and Employee_Train_eastid.flag=0 )'+#13+
                         ' or Employee_Train_eastid.rkey in ('+ inRkey+'))';
//    ShowMessage(CommandText);
    Open;
    Sort:='card_time';
  end;
end;

procedure TfrmSelTime.FormDestroy(Sender: TObject);
begin
  DM.adoSelTime.Close;
  DM.adoSelTime.CommandText:=sqlstr ;
end;

end.

