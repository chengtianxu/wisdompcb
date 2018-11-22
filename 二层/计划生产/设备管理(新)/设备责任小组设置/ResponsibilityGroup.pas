unit ResponsibilityGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrm_ResponsilibyGroup = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Cbb_Abbr_Name: TComboBox;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitSaveClick(Sender: TObject);
  private
     vlocation:string;
     function find_location(location:string):Boolean;
    { Private declarations }
  public
    v_status,rkey840:Integer;
    { Public declarations }
  end;

var
  frm_ResponsilibyGroup: Tfrm_ResponsilibyGroup;

implementation

uses damo;

{$R *.dfm}



procedure Tfrm_ResponsilibyGroup.FormShow(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,abbr_name from data0015');
    open;
  end;
  DM.tmp.First;
  Cbb_ABBR_NAME.Items.Clear;
  while not DM.tmp.Eof do
  begin
    Cbb_ABBR_NAME.Items.AddObject(DM.tmp.FieldValues['abbr_name'],Pointer(DM.tmp.FieldByName('rkey').AsInteger));
    DM.tmp.Next;
  end;

  if (v_status = 1) or (v_status=2) then
  begin
    with DM.ADS840 do
    begin
      Cbb_ABBR_NAME.ItemIndex := Cbb_ABBR_NAME.Items.IndexOf(FieldByName('ABBR_NAME').AsString);
      Edit1.Text := FieldByName('location').Value;
      if DM.ADS840vOutdPrep.Value='是' then
      begin
        CheckBox1.Checked := True;
      end
      else
      begin
        CheckBox1.Checked := False;
      end;
      if DM.ADS840vactive.Value ='是' then
      begin
        CheckBox2.Checked := True;
      end
      else
      begin
        CheckBox2.Checked :=False;
      end;
    end;
  end;
  if (v_status=2) then
  begin
    BitSave.Enabled := False;
    Cbb_Abbr_Name.Enabled := False;
    Edit1.Enabled := False;
    CheckBox1.Enabled := False;
    CheckBox2.Enabled :=False;
  end;
  vlocation := Edit1.Text;
end;

function Tfrm_ResponsilibyGroup.find_location(location: string): Boolean;
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey from data0840 where location='''+location+'''';
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
    Result:=False
  else
    Result :=True;
end;

procedure Tfrm_ResponsilibyGroup.BitSaveClick(Sender: TObject);
var
  lchecked,lchekedactive:Integer;
begin
  if Cbb_Abbr_Name.ItemIndex=-1 then
  begin
    MessageDlg('工厂不能为空',mtInformation,[mbCancel],0);
    Cbb_ABBR_NAME.SetFocus;
    Exit;
  end;
  if Edit1.Text='' then
  begin
    MessageDlg('责任小组不能为空',mtInformation,[mbCancel],0);
    Edit1.SetFocus;
    Exit;
  end;
  if v_status=0 then
  begin
    if find_location(Edit1.Text)  then
    begin
      MessageDlg('责任小组重复,请重新输入',mtInformation,[mbCancel],0);
      Edit1.SetFocus;
      Exit;
    end;
    try
      DM.ADOConnection1.BeginTrans;
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'select rkey, location,OutsPrep,D015_ptr,active from data0840 where rkey is null';
        Open;
        Append;
        FieldByName('location').Value := Edit1.Text;
        if CheckBox1.Checked then
        begin
          FieldByName('OutsPrep').Value := 1;
        end
        else
        begin
          FieldByName('OutsPrep').Value := 0;
        end;
        FieldByName('D015_ptr').Value :=Integer(Cbb_Abbr_Name.Items.Objects[Cbb_Abbr_Name.ItemIndex]);
        if CheckBox2.Checked then
        begin
          FieldByName('active').Value := 1;
        end
        else
        begin
          FieldByName('active').Value := 0;
        end;
        Post;
        rkey840 := FieldByName('rkey').Value;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        MessageDlg(E.Message,mtError,[mbCancel],0);
      end;
    end;
  end;
  if v_status=1 then
  begin
    if find_location(Edit1.Text) and (Edit1.Text <>vlocation) then
    begin
      MessageDlg('责任小组重复,请重新输入',mtInformation,[mbCancel],0);
      Edit1.SetFocus;
      Exit;
    end;
    if CheckBox1.Checked then
    begin
      lchecked := 1;
    end
    else
    begin
      lchecked:=0;
    end;
    if CheckBox2.Checked then
    begin
      lchekedactive :=1;
    end
    else
    begin
      lchekedactive :=0;
    end;
    with DM.tmp do
    begin
      Close;
      SQL.Text := ' update data0840 set location='+QuotedStr(edit1.Text)+',OutsPrep='+inttostr(lchecked)+',D015_ptr='+
      IntToStr(Integer(Cbb_Abbr_Name.Items.Objects[Cbb_Abbr_Name.ItemIndex]))+',active='+inttostr(lchekedactive)+
      ' where rkey ='+dm.ADS840rkey.AsString;
      ExecSQL;
    end;
    ModalResult := mrOk;
  end;
end;

end.
