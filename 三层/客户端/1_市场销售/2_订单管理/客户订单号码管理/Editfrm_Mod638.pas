unit Editfrm_Mod638;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, RzEdit, RzBtnEdt, uBaseEditFrm,
  uRKeyBtnEdit, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,uCommFunc,
  Vcl.Buttons,uBaseSinglePickListFrm, Vcl.ComCtrls, Vcl.DBCtrls;

type
  TfrmEdit_mod638 = class(TfrmBaseEdit)
    RKeyRzBtnEdit1: TRKeyRzBtnEdit;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    cds97: TClientDataSet;
    ds97: TDataSource;
    Memo3: TMemo;
    Edit3: TEdit;
    DtpReqDate: TDateTimePicker;
    BtnUpload: TSpeedButton;
    RkyDocname: TRKeyRzBtnEdit;
    OpenDialog1: TOpenDialog;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure BtnUploadClick(Sender: TObject);
  private
    { Private declarations }
  public
   FDetailType:Integer;
   procedure GetData(ARkey97:string);
   procedure Init;
    { Public declarations }
  end;

var
  frmEdit_mod638: TfrmEdit_mod638;

implementation
 uses
 MainFrm_Mod638;
{$R *.dfm}

procedure TfrmEdit_mod638.btnCloseClick(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TfrmEdit_mod638.btnSaveClick(Sender: TObject);
begin
  inherited;

  if gSvrIntf.IntfPostDataByTable('Data0097',cds97.Delta) then
  begin
    ShowMessage('保存成功！');
    ModalResult:= mrOk;
  end;

end;

procedure TfrmEdit_mod638.BtnUploadClick(Sender: TObject);
var i:integer;
    s:string;
    fs: TMemoryStream;
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    for i:=length(OpenDialog1.FileName) downto 1 do
    begin
      if  OpenDialog1.FileName[i]<>'\' then
         s:=OpenDialog1.FileName[i]+s
      else
         break;
    end;
    fs := TMemoryStream.Create;
    fs.LoadFromFile(OpenDialog1.FileName);
    if fs.Size>10*1024*1024 then
    begin
      showmessage('文件大小不能超过10M,请重新整理文件再保存...');
      fs.Free;
      exit;
    end;
//    PackStream(fs);
    cds97.Edit;
    cds97.FieldByName('file_name').Value:=s;
    cds97.Post;
//    Fmem[cds97.RecNo-1].fileName:=OpenDialog1.FileName;
//    Fmem[cds97.RecNo-1].bWhere:=false;
    fs.Free;
  end;
end;

procedure TfrmEdit_mod638.dtpDateChange(Sender: TObject);
begin
  inherited;
   cds97.First;
  cds97.Edit;
  cds97.FieldByName('po_date').Value:= DtpReqDate.Date;
  cds97.Post;
end;

procedure TfrmEdit_mod638.GetData(ARkey97: string);
var
 LSql97:string;
begin
  LSql97:='select * from data0097 where rkey= '+ ARkey97;

 if not gSvrIntf.IntfGetDataBySql(LSql97, cds97) then Exit;
end;
procedure TfrmEdit_mod638.Init;

begin
 if FDetailType=0 then
 begin
   cds97.Edit;
   cds97.
 end;

end;
end.
