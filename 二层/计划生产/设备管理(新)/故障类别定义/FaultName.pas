unit FaultName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrm_FaultName = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitCancel: TBitBtn;
    BitSave: TBitBtn;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure  invo_fault_error(faultName: string);
    { Private declarations }
  public
    v_status,rkey846:Integer;
    { Public declarations }
  end;

var
  frm_FaultName: Tfrm_FaultName;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_FaultName.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13])  then abort;//判断是否输入数字
  if key = chr(46) then
  if pos('.',Edit2.Text)>0 then abort;//第二列小数点'.'不能重复
end;

procedure Tfrm_FaultName.invo_fault_error(faultName: string);
begin
  with dm.tmp do
  begin
    close;
    SQL.Text:='select rkey, FaultName from Data0846 where D845_ptr='+dm.ADS845rkey.AsString+' and FaultName='+QuotedStr(faultName);
    open;
    if not IsEmpty then
    begin
      ShowMessage('本故障类别的故障名称重复，请重新输入');
      Abort;
    end;
  end;
end;

procedure Tfrm_FaultName.BitSaveClick(Sender: TObject);
begin
  if Edit1.Text ='' then
  begin
    ShowMessage('请添加故障名称');
    Edit1.SetFocus;
    Exit;
  end;
  if v_status=0 then
  begin
    Self.invo_fault_error(Edit1.Text);
    try
      with DM.tmp do
      begin
        Close;
        SQL.Text :='select rkey,D845_ptr,FaultName,stdDate from data0846 where rkey is null';
        Open;
        Append;
        FieldByName('D845_ptr').Value := DM.ADS845rkey.Value;
        FieldByName('FaultName').Value := Edit1.Text;
        if Edit2.Text<>'' then
        FieldByName('stdDate').Value := Edit2.Text;
        Post;
        rkey846 := FieldByName('rkey').Value ;
      end;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        MessageDlg(E.Message,mtError,[mbCancel],0);
      end;
    end;
  end;
  if v_status=1 then
  begin
    try
      with DM.tmp do
      begin                                            
        Close;
        if Edit2.Text ='' then
          SQL.Text :='update data0846 set D845_ptr='+dm.ADS845rkey.AsString+',FaultName='+quotedstr(Edit1.Text)+
          ',stdDate=0 where rkey ='+dm.ADS846rkey.AsString
        else
          SQL.Text :='update data0846 set D845_ptr='+dm.ADS845rkey.AsString+',FaultName='+quotedstr(Edit1.Text)+
          ',stdDate='+quotedstr(Edit2.Text)+'  where rkey ='+dm.ADS846rkey.AsString;
        ExecSQL;
      end;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        ShowMessage('故障名称重复，请重新输入');
//        MessageDlg(E.Message,mtError,[mbCancel],0);
      end;
    end;
  end;

end;



procedure Tfrm_FaultName.FormShow(Sender: TObject);
begin
  if v_status =1 then
  begin
    Edit1.Text := DM.ADS846FaultName.Value;
    Edit2.Text := DM.ADS846stdDate.AsString;
  end;
end;

end.
