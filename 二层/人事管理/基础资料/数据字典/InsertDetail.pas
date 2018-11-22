unit InsertDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm_InsertDetail = class(TForm)
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    ADODetail: TADODataSet;
    ADODetailCOLUMN1: TIntegerField;
    Memo1: TMemo;
    Label3: TLabel;
    procedure BitCancelClick(Sender: TObject);
    procedure BitSaveClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    edit:Boolean;
  public
    { Public declarations }
  end;

var
  Form_InsertDetail: TForm_InsertDetail;

implementation

uses dmo;


{$R *.dfm}

procedure TForm_InsertDetail.FormCreate(Sender: TObject);
begin
  edit:=False;
  ADODetail.Close;
  ADODetail.CommandText:='select count(*) from datadetail where dictid='+dm.ADODictrkey.Text;
  ADODetail.Open
end;

procedure TForm_InsertDetail.BitSaveClick(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('类别明细不能为空，请输入类别明细名称');
    Edit1.SetFocus;
    Exit;
  end
  else
  begin
    ADODetail.Close;
    ADODetail.CommandText:=ADODetail.CommandText+' and item='''+trim(Edit1.Text)+'''';
    ADODetail.Open;
  end;
  if ADODetailCOLUMN1.Value>0 then
  begin
    ShowMessage('此类别明细已存在，请重新输入类别明细名称');
    ADODetail.Close;
    ADODetail.CommandText:='select count(*) from datadetail where dictid='+dm.ADODictrkey.Text;
    ADODetail.Open;
    Edit1.SetFocus;
    Exit;
  end;
  if DM.ADODetail.State=dsInsert then
  begin
    dm.ADODict.MoveBy(ComboBox1.ItemIndex+1-dm.ADODict.RecNo);
    DM.ADODetaildictid.Value:=DM.ADODictrkey.Value;
    DM.ADODetailmemo.Value:= Memo1.Text  ;
    dm.ADODetailitem.Value:=Edit1.Text;
  end
  else
  begin
    dm.ADODict.MoveBy(ComboBox1.ItemIndex+1-dm.ADODict.RecNo);
    DM.ADODetailitem.Value:=Edit1.Text;
  end;
  DM.ADODetail.Post;
  ModalResult:=mrOk;
end;

procedure TForm_InsertDetail.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  edit:=True;
end;

procedure TForm_InsertDetail.BitCancelClick(Sender: TObject);
var
  msg:Integer;
begin
  msg:=0;
  if dm.ADODetail.State=dsInsert then
  begin
    DM.ADODetail.Cancel;
    ModalResult:=mrCancel;
  end
  else
  begin
    if (DM.ADODetail.Modified) or (edit) then
      msg:=MessageDlg('数据已被修改，是否保存数据？',mtInformation,[mbYes,mbNo],0);
    if msg=7 then
    begin
      dm.ADODetail.Cancel;
      ModalResult:=mrCancel;
    end
    else
    begin
      if msg=6 then
        BitSaveClick(nil)
      else
        dm.ADODetail.Cancel;
        ModalResult:=mrCancel;
    end;
  end;
end;
end.
