unit UDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule, ComCtrls, DateUtils;

type
  TDetail_Form = class(TForm)
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label11: TLabel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit4: TEdit;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    DateTimePicker3: TDateTimePicker;
    Label7: TLabel;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    Label8: TLabel;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Detail_Form: TDetail_Form;

implementation

uses UDM,common,Pick_Item_Single,ConstVar,UMain, ufrmadmin;

{$R *.dfm}

procedure TDetail_Form.FormShow(Sender: TObject);
begin
  dm.last_rkey := 0;
  dm.last_remark :='';
  dm.new_remark :='';
  Self.ComboBox2.Items.Clear;
  Self.ComboBox1.Items.Clear;
  with DM.tmp1 do
  begin
        Close;
        SQL.Clear;
        SQL.Text:='SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 5 '+#13;
        Open;
        first;
        while not Eof do
        begin
              ComboBox2.Items.Add(FieldByName('item').AsString);
              ComboBox1.Items.Add(FieldByName('rkey').AsString);
              Next;
        end;
  end;
  if Dm.Tag in  [1,3] then
    begin
      dm.last_rkey := dm.employee_contract.FieldValues['rkey'];
      dm.last_remark := dm.employee_contract.FieldValues['remark'];
       dm.new_remark := ' 原合同 从 '
        +datetostr(DM.employee_contract.fieldByname('startdate').AsDateTime)+'到 '
        +datetostr(DM.employee_contract.fieldByname('enddate').AsDateTime)+' 结束';

      Edit1.Text := DM.employee_contract.FieldValues['code'];

      Edit4.Text := DM.employee_contract.FieldValues['chinesename'];

      if DM.employee_contract.fieldByname('status').AsInteger = 1 then
        RadioGroup1.ItemIndex := 0;

      if DM.employee_contract.fieldByname('status').AsInteger = 2 then
        RadioGroup1.ItemIndex := 1;

      if ((not DM.employee_contract.fieldByname('startdate').IsNull) and (Dm.Tag=1)) then
      DateTimePicker1.Date := DM.employee_contract.fieldByname('startdate').AsDateTime
      else
      DateTimePicker1.Date := incday(DM.employee_contract.fieldByname('enddate').AsDateTime,1);

      if (not DM.employee_contract.fieldByname('probationdate').IsNull) then
         begin
          DateTimePicker3.Visible := false;
          Edit2.Visible := True;
          DateTimePicker3.Date := DM.employee_contract.fieldByname('probationdate').AsDateTime ;
          edit2.Text := datetostr(DateTimePicker3.Date);
         end
      else
        begin
            DateTimePicker3.Visible := False;
            Edit2.Visible := True; 
        end;


      if not DM.employee_contract.fieldByname('enddate').IsNull then
      DateTimePicker2.Date := DM.employee_contract.fieldByname('enddate').AsDateTime;

      if dm.Tag=3  then
      DateTimePicker2.Date := incday(incyear(DM.employee_contract.fieldByname('enddate').AsDateTime,3),-1);

      if (DM.employee_contract.fieldByname('remark').AsString <> '')
      and (not DM.employee_contract.fieldByname('remark').IsNull) then
      Memo1.Text := DM.employee_contract.fieldByname('remark').AsString;

      if dm.tag=3 then  memo1.Text := memo1.Text + #13#10+dm.new_remark;

      ComboBox2.Text :=  DM.employee_contract.fieldByname('item').AsString;
      with DM.tmp do
      begin
          Close;
          SQL.Clear;
          SQL.Text := 'select rkey FROM  dbo.datadetail WHERE dictid = 5 and item='+quotedStr(ComboBox2.Text);
          Open;
          ComboBox1.Text := IntToStr(FieldValues['rkey']);
          Close;
          SQL.Clear;
          SQL.Text := 'select employeeid FROM  dbo.employee_contract WHERE rkey = '+ IntToStr(DM.employee_contract.FieldValues['rkey']);
          Open;
          Edit4.Tag := FieldValues['employeeid'];
          SQL.Clear;
          SQL.Text:='select data0005.rkey from data0005 inner join '
            + 'data0073 on data0005.rkey=data0073.employee_ptr where data0073.rkey= '+ rkey73;
          Open;
          Label5.Caption := FieldValues['rkey'];
      end;
    end
  else
    begin
      with DM.tmp1 do
      begin
          Close;
          SQL.Clear;
          SQL.Text:=' select getdate() '+#13;
          Open;
          DateTimePicker1.Date:= Fields[0].AsDateTime;
          DateTimePicker2.Date:= IncYear(Fields[0].AsDateTime, +3);
          DateTimePicker3.Date:= IncMonth(Fields[0].AsDateTime, +3);
          edit2.Text:= datetostr(datetimepicker3.Date);
          Close;
          SQL.Clear;
          SQL.Text:='select data0005.rkey from data0005 inner join '
            + 'data0073 on data0005.rkey=data0073.employee_ptr where data0073.rkey= '+ rkey73;
          Open;
          Label5.Caption := FieldValues['rkey'];
      end;
    end;

end;

procedure TDetail_Form.BitBtn1Click(Sender: TObject);
var
  statusTag: Integer;
begin

  if RadioGroup1.ItemIndex = 0 then statusTag := 1;
  if RadioGroup1.ItemIndex = 1 then statusTag := 2;
  
  if DM.Tag = 1 then
  begin
    with Dm.tmp do
    begin
      SQL.Clear;
       if edit2.Text <>'' then
      SQL.Text := 'update employee_contract set code=' + QuotedStr(Edit1.Text) + ','
        + 'employeeid=' + IntToStr(Edit4.Tag) + ','
        + 'startdate=' + QuotedStr(DateToStr(DateTimePicker1.Date)) + ','
        + 'probationdate=' + QuotedStr(DateToStr(DateTimePicker3.Date)) + ','
        + 'enddate=' + QuotedStr(DateToStr(DateTimePicker2.Date)) + ','
        + 'type=' + Trim(Self.ComboBox1.text) + ','
        + 'inputdate=' + QuotedStr(DateToStr(now)) + ','
        + 'remark=' + QuotedStr(Memo1.Text) + ','
        + 'status=' + IntToStr(statusTag) + ','
        + 'opration_person=(select data0005.rkey from data0005 inner join '
        + 'data0073 on data0005.rkey=data0073.employee_ptr where data0073.rkey= '+ rkey73 +')'
        + 'where rkey = ' + IntToStr(DM.employee_contract.FieldValues['rkey'])
        else
           SQL.Text := 'update employee_contract set code=' + QuotedStr(Edit1.Text) + ','
        + 'employeeid=' + IntToStr(Edit4.Tag) + ','
        + 'startdate=' + QuotedStr(DateToStr(DateTimePicker1.Date)) + ','
        //+ 'probationdate=' + QuotedStr(DateToStr(DateTimePicker3.Date)) + ','
        + 'enddate=' + QuotedStr(DateToStr(DateTimePicker2.Date)) + ','
        + 'type=' + Trim(Self.ComboBox1.text) + ','
        + 'inputdate=' + QuotedStr(DateToStr(now)) + ','
        + 'remark=' + QuotedStr(Memo1.Text) + ','
        + 'status=' + IntToStr(statusTag) + ','
        + 'opration_person=(select data0005.rkey from data0005 inner join '
        + 'data0073 on data0005.rkey=data0073.employee_ptr where data0073.rkey= '+ rkey73 +')'
        + 'where rkey = ' + IntToStr(DM.employee_contract.FieldValues['rkey']);
      ExecSQL;
    end;
  end
  else
  begin
      if Trim(Edit1.Text) = '' then
      begin
        ShowMessage('合同编号不可为空，请填入合同编号');
        Edit1.SetFocus;
        abort;
      end;
      if Trim(Edit4.Text) = '' then
      begin
        ShowMessage('合同员工不可为空，请填入合同员工或选择员工');
        Edit4.SetFocus;
        abort;
      end;
      if Trim(Self.ComboBox2.Text) = '' then
      begin
        ShowMessage('合同类型不可为空，请选择合同类型');
        Self.ComboBox2.SetFocus;
        abort;
      end;

      if DateTimePicker1.DateTime >= DateTimePicker2.DateTime then
      begin
          ShowMessage('合同时间有误，请修正');
          abort;
      end;

      with DM.tmp1 do
      begin
          Close;
          SQL.Clear;
          SQL.Text:='SELECT  code   FROM  employee_contract where code = '''+Self.Edit1.Text+''''+#13;
          Open;
          if not IsEmpty then
          begin
              if MessageBox(Handle,'合同编号有重复，是否继续?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          end;
      end;

       if DM.ADOConnection1.Connected then
       begin
                    try
                         DM.employee_contract_1.Close;
                         DM.employee_contract_1.Open;
                         DM.employee_contract_1.Append;
                         DM.employee_contract_1.FieldByName('code').AsString := Self.edit1.text;
                         DM.employee_contract_1.FieldByName('employeeid').Value := Self.edit4.tag;
                         DM.employee_contract_1.FieldByName('startdate').Value := Self.DateTimePicker1.Date;

                         IF  (edit2.Text <>'') then
                         DM.employee_contract_1.FieldByName('probationdate').Value := strtodate(edit2.Text)//Self.DateTimePicker3.Date
                         else
                         DM.employee_contract_1.FieldByName('probationdate').Value := NULL;

                         DM.employee_contract_1.FieldByName('enddate').Value := Self.DateTimePicker2.Date;
                         DM.employee_contract_1.FieldByName('type').AsInteger := StrToInt(Trim(Self.ComboBox1.text));
                         DM.employee_contract_1.FieldByName('remark').AsString := Memo1.Text;
                         DM.employee_contract_1.FieldByName('status').AsInteger := statusTag;
                         with DM.tmp1 do
                         begin
                              Close;
                              SQL.Clear;
                              SQL.Text:=' select convert(datetime,substring(convert(nvarchar(20),getdate(),120),1,10),120) '+#13;
                              Open;
                              DM.employee_contract_1.FieldByName('inputdate').Value := Fields[0].AsDateTime;
                              if DateTimePicker2.DateTime < Fields[0].AsDateTime then
                              begin
                                 if MessageBox(Handle,'当前日期已超过合同结束日期，保存后合同将为无效状态，是否继续?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
                                      DM.employee_contract_1.FieldByName('status').AsInteger := 2
                              end
                              else
                                  DM.employee_contract_1.FieldByName('status').AsInteger := 1;
                         end;
                         if Label5.Caption <> '' then
                         DM.employee_contract_1.FieldByName('opration_person').AsInteger := StrToInt(Label5.Caption);

                         DM.ADOConnection1.BeginTrans;
                         DM.employee_contract_1.Post;
                         DM.employee_contract_1.UpdateBatch(arAll);
                         DM.ADOConnection1.CommitTrans;
                         Main_Form.newrkey := DM.employee_contract_1.FieldByName('rkey').AsString;
                         dm.tmp1.SQL.Clear;
                         dm.tmp1.SQL.Text := ' update employee_contract set status=2,opration_person='+Label5.Caption
                          +' from employee_contract where rkey='+inttostr(dm.last_rkey);
                         dm.tmp1.ExecSQL;
                         dm.tmp1.SQL.Clear;
                    except
                              DM.ADOConnection1.RollbackTrans;
                              showmessage('保存数据失败...');
                    end;




       end;
  end;
       ModalResult:=mrok;
end;

procedure TDetail_Form.ComboBox2Change(Sender: TObject);
begin
    Self.ComboBox1.ItemIndex := Self.ComboBox2.ItemIndex;
end;

procedure TDetail_Form.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
      InputVar.Fields := 'employeecode/员工编号/200,chinesename/员工姓名/200';
      InputVar.Sqlstr :='select  rkey, chinesename, employeecode from dbo.employeemsg ';
      inputvar.KeyField:='rkey';
      InputVar.AdoConn := DM.ADOConnection1;
      frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit4.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      Edit4.Text := frmPick_Item_Single.adsPick.FieldValues['employeecode'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TDetail_Form.Edit4Exit(Sender: TObject);
begin
 if (Edit4.Text='')  then exit;
   DM.tmp1.Close;
   DM.tmp1.SQL.Clear;
   DM.tmp1.SQL.Text:='select rkey, chinesename from dbo.employeemsg where  chinesename='''+Edit4.Text+'''';
   DM.tmp1.Open;
   if DM.tmp1.IsEmpty then
   begin
     messagedlg('没有这个员工,请重新输入或选择',mtinformation,[mbok],0);
     Edit4.Tag := 0;
     Edit4.SetFocus;
   end else begin
     Edit4.Text:=DM.tmp1.FieldValues['chinesename'];
     Edit4.Tag :=DM.tmp1.FieldValues['rkey'];
   end;
end;

procedure TDetail_Form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8,'a'..'z','A'..'Z']) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
   if (key='.') and (Pos('.',(Sender as TEdit).Text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TDetail_Form.Edit2Exit(Sender: TObject);
begin

if edit2.Text<> NULL then
begin    
  if  edit2.Text<>''  then
  begin
    try
      datetimepicker3.Date := strtodate(edit2.Text);
     except
      showmessage('无效的日期格式');
      edit2.SetFocus;
      abort;
     end;
  end;
end;
 //showmessage('a');
//if edit2.Text ='' then  edit2.Text := NULL ;


end;

end.
