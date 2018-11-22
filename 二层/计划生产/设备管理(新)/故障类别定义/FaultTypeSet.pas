unit FaultTypeSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus;

type
  Tfrm_FaultTypeSet = class(TForm)
    Label1: TLabel;
    Edt_FaultDesc: TEdit;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    procedure BitSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure  invo_fault_error(faultDesc: string);
    { Private declarations }
  public
    v_status,rkey845 :Integer;
    { Public declarations }
  end;

var
  frm_FaultTypeSet: Tfrm_FaultTypeSet;

implementation

uses damo;

{$R *.dfm}

procedure  Tfrm_FaultTypeSet.invo_fault_error(faultDesc: string);
begin
  with dm.tmp do
  begin
    close;
    SQL.Text:='select rkey, FaultDesc from Data0845 where FaultDesc='+QuotedStr(faultDesc);
    open;
    if not IsEmpty then
    begin
      ShowMessage('故障类别重复，请重新输入');
      Abort;
    end;
  end;


end;

procedure Tfrm_FaultTypeSet.BitSaveClick(Sender: TObject);
begin
  if Trim(Edt_FaultDesc.Text)='' then
  begin
    ShowMessage('故障类别不能为空，请输入故障类别');
    Edt_FaultDesc.SetFocus;
    Exit;
  end;

  if v_status=0 then
  begin
    Self.invo_fault_error(Edt_FaultDesc.Text);
    try
      with DM.tmp do
      begin
        Close;
        SQL.Text :='select rkey,FaultDesc from data0845 where rkey is null';
        Open;
        Append;
        FieldByName('FaultDesc').Value := Edt_FaultDesc.Text;
        Post;
        rkey845 := FieldByName('rkey').Value ;
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
        SQL.Text :='update data0845 set FaultDesc='+quotedstr(Edt_FaultDesc.Text)+'  where rkey ='+dm.ADS845rkey.AsString;
        ExecSQL;
      end;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        ShowMessage('故障类别重复，请重新输入');
//        MessageDlg(E.Message,mtError,[mbCancel],0);
      end;
    end;
  end;
end;

procedure Tfrm_FaultTypeSet.FormShow(Sender: TObject);
begin
  if v_status =1 then
  begin
    Edt_FaultDesc.Text := DM.ADS845FaultDesc.Value;
  end;
end;

end.
