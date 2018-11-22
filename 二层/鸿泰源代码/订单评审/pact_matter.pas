unit pact_matter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls,
  ComCtrls, Menus, MXPIVSRC, TeeProcs, TeEngine, Chart, MXGRAPH, Mxstore,
  MXDB, Series,DateUtils;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Splitter2: TSplitter;
    Memo1: TMemo;
    DBGrid3: TDBGrid;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    Button3: TButton;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid4: TDBGrid;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    TabSheet3: TTabSheet;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    TabSheet4: TTabSheet;
    DBGrid5: TDBGrid;
    TabSheet5: TTabSheet;
    DBGrid6: TDBGrid;
    Label8: TLabel;
    DBText1: TDBText;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DBText3: TDBText;
    Label9: TLabel;
    TabSheet6: TTabSheet;
    Button4: TButton;
    Label11: TLabel;
    DBText4: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBText5: TDBText;
    Label20: TLabel;
    DBGrid7: TDBGrid;
    DBText6: TDBText;
    ComboBox1: TComboBox;
    Label10: TLabel;
    Label21: TLabel;
    CheckBox1: TCheckBox;
    rdgttype: TRadioGroup;
    rdgGrade: TRadioGroup;
    DBEdit4: TDBEdit;
    Label22: TLabel;
    DBCheckBox5: TDBCheckBox;
    lbl1: TLabel;
    lbl2: TLabel;
    price2: TDBEdit;
    lbl3: TLabel;
    price3: TDBEdit;
    price1: TDBEdit;
    lbl5: TLabel;
    price4: TDBEdit;
    lbl4: TLabel;
    dbedtMANU_PART_DESC: TDBEdit;
    lbl6: TLabel;
    dbedtMANU_PART_DESC1: TDBEdit;
    lbl7: TLabel;
    price5: TDBEdit;
    lbl8: TLabel;
    dbedtCURR_CODE1: TDBEdit;
    lbl9: TLabel;
    dbedtORIG_CUSTOMER: TDBEdit;
    lbl10: TLabel;
    dbedtORIG_CUSTOMER1: TDBEdit;
    dbmmoreference_number: TDBMemo;
    dbchkbarcode_flag: TDBCheckBox;
    dbchkNOPB_flag: TDBCheckBox;
    dbchkCURRENT_REV: TDBCheckBox;
    lbl11: TLabel;
    dbedtANALYSIS_CODE_1: TDBEdit;
    lbl12: TLabel;
    dbtxtDUE_DATE: TDBText;
    lbl13: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure rdgttypeClick(Sender: TObject);
    procedure AllFilter;
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

    OldGridWnd : TWndMethod;
    procedure NewGridWnd (var Message : TMessage);

  end;

var
  Form2: TForm2;
implementation

uses damo, main, note_search, so_sch_date,common;

{$R *.dfm}

procedure TForm2.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
//with dm.AQ9711 do
// begin
//  close;
//  dm.AQ9711.Parameters[0].Value:=dm.ADO97RKEY60.Value;
//  active:=true;
//  if not isempty then  memo1.Text:= dm.AQ9711memo_text.Value;
// end;

  with dm.ADOQuery1 do                     //查找加工指示
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select data0025.remark,data0025.eng_note,');
    sql.Add('Data0008.PRODUCT_NAME,Data0008.LEAD_TIME');
    sql.Add('from data0025 inner join data0008 on');
    sql.Add('Data0025.PROD_CODE_PTR=Data0008.RKEY');
    sql.add('where data0025.rkey='+dm.ADO97cust_part_ptr.AsString);
    active := true;
    memo3.Text:=fieldbyname('remark').AsString;  //指示
    MEMO2.Text:=fieldbyname('eng_note').AsString;  //备注
    label13.Caption :=fieldvalues['product_name'];
    label14.Caption :=fieldbyname('lead_time').AsString;
    if fieldvalues['lead_time']<>0 then
    label17.Caption := formatfloat('0.0',
    (dm.ADO97ORIG_SCHED_SHIP_DATE.Value-form1.server_date)/fieldvalues['lead_time']);
   end;

  with dm.ADOQuery1 do
  begin
     ComboBox1.Items.Clear;
     ComboBox1.Items.Append('所有');
     ComboBox1.ItemIndex:=0;
     close;
     SQL.Text:='select abbr_name from data0015';
     open;
     while not EOF do
     begin
       ComboBox1.Items.Append(fields[0].asstring);
       next;
     end;
  end;

  with dm.ADOQuery1 do                     //查找销售定单记事本
  begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select RemarkSO,RemarkAudit from data0060 where rkey='+dm.ADO97rkey60.AsString);
    active := true;
    if not isempty then
    begin
      memo4.Text:= Fieldbyname('RemarkSO').AsString;
      Memo1.Text:=Fieldbyname('RemarkAudit').AsString;
    end;
  end;

//  with dm.ADOQuery1 do                     //查找销售定单记事本
//   begin
//    if active=true then active:=false;
//    sql.Clear;
//    sql.Add('select * from data0011');
//    sql.Add('where source_type=60 and');
//    sql.add('file_pointer='+dm.ADO97rkey60.AsString);
//    active := true;
//    if not isempty then  memo4.Text:= Fieldbyname('memo_text').AsString;
//   end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 com_qty:integer;
begin
  com_qty:=0;
  dm.ADO360.First;
  while not dm.ADO360.Eof do
  begin
    com_qty:=com_qty+dm.ADO360quantity.Value;
    dm.ADO360.Next;
  end;
  if  DBCheckBox5.Checked=True  then
  begin
    messagedlg('该产品有高难度管控标识，请注意是否已通过超能力评审!',mtConFirmation,[mbYes,mbNo],0)
  end;
  if com_qty<>dm.ADO97PARTS_ORDERED.Value then
  begin
    showmessage('完成数量不等于订单数量,请编辑相等!');
    pagecontrol1.ActivePageIndex:=4;
    dbgrid6.SetFocus;
  end
  else
  begin
    if checkbox1.Visible then
    if not Msg_Dlg_Ask('该客户为绝对保证交期,请再次确认！','提示信息',1) then
      exit;
    with dm.tmp do  //处理通过评审记事本
    begin
      sql.Clear;
      SQL.Add('update data0060 set RemarkAudit='''+trim(memo1.Text)+''' where Rkey='+dm.ADO97RKEY60.AsString);
      ExecSQL;
      DM.ADO360.UpdateBatch();
      ModalResult:=mrok;
    end;
//    with dm.AQ9711 do           //处理记事本
//    begin
//      if (not IsEmpty) and (trim(memo1.Text)<>'') then
//      begin
//        edit;
//        dm.AQ9711memo_text.Value:=memo1.Text;
//        post;
//      end
//      else
//      if (not IsEmpty) and (trim(memo1.Text)='') then
//        Delete
//      else
//        if (IsEmpty) and (trim(memo1.Text)<>'') then
//        begin
//          Append;
//          dm.AQ9711FILE_POINTER.Value:=dm.ADO97RKEY60.Value;
//          dm.AQ9711SOURCE_TYPE.Value:=1060;
//          dm.AQ9711memo_text.Value:=memo1.Text;
//          Post;
//        end;
//      dm.AQ9711.Close;
//      DM.ADO360.UpdateBatch();
//      ModalResult:=mrok;
//    end;
  end;
end;

procedure TForm2.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.ado60.SQL.Text);
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
 i:byte;
begin
 try
 note_form := tnote_form.Create(application);
 if note_form.ShowModal=mrok then
 begin
  for i:=1 to 4 do
   memo1.lines.add(note_form.Adoquery1.fieldbyname('note_pad_line_'+inttostr(i)).asstring);
 end;
 finally
  note_form.Free;
 end;
end;

procedure TForm2.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
 button1.SetFocus;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if (trim(memo1.Text)='') then
 showmessage('退回原因不能为空!')
else
begin
    with dm.tmp do  //处理通过评审记事本
    begin
      sql.Clear;
      SQL.Add('update data0060 set RemarkAudit='''+trim(memo1.Text)+''' where Rkey='+dm.ADO97RKEY60.AsString);
      ExecSQL;
    end;

//  with dm.AQ9711 do           //处理记事本
//  begin
//   if (not IsEmpty) and (trim(memo1.Text)<>'') then
//    begin
//     edit;
//     dm.AQ9711memo_text.Value:=memo1.Text;
//     post;
//    end
//   else
//    if (not IsEmpty) and (trim(memo1.Text)='') then
//     Delete
//    else
//     if (IsEmpty) and (trim(memo1.Text)<>'') then
//      begin
//        Append;
//        dm.AQ9711FILE_POINTER.Value:=dm.ADO97RKEY60.Value;
//        dm.AQ9711SOURCE_TYPE.Value:=1060;
//        dm.AQ9711memo_text.Value:=memo1.Text;
//        Post;
//      end;
//   end;
 dm.AQ9711.Close;
 dm.ADO9060.Close;
 dm.ADO9060.Parameters[0].Value := dm.ADO97rkey60.Value;
 dm.ADO9060.Parameters[1].Value := form1.dept_rkey;
 dm.ADO9060.Open;
 dm.ADO9060.Edit;
 dm.ADO9060user_ptr.AsVariant := null;      //评审员工90
 dm.ADO9060auth_date.AsVariant := null;     //评审日期90
 dm.ADO9060rma_ptr.Value := form1.employee_rkey;   //退回员工60
 dm.ADO9060MFG_ORDER_DATE.Value := form1.long_server_date;  //退回日期60
 dm.ADO9060quote_price.Value :=2;         //标记退回60
 dm.ADO9060.Post;
 dm.ADO360.CancelBatch();
 dm.ADO97.Close;
 dm.ADO97.Open;
 close;
end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm2.N2Click(Sender: TObject);
var
  q:Integer;
begin
  if messagedlg('您确定要删除该项计划吗?',mtconfirmation,[mbYes,mbNo],0)=mryes then
  begin
    q:=DM.ADO360quantity.Value;
    dm.ado360.delete;
    DM.ADO360.RecNo:=1;
    DM.ADO360.Edit;
    DM.ADO360quantity.Value:=DM.ADO360quantity.Value+q;
    DM.ADO360.Post;
  end;
end;

procedure TForm2.N1Click(Sender: TObject);
var
  i:Byte;
  qty2:Integer;
  list:TStringList;
  sch_date:TDateTime;
  qty,r:Integer;
begin
  form5:=tform5.Create(application);
  list:=TStringList.Create;
  try
    qty:=DM.ADO360quantity.Value;
    r:=DM.ADO360.RecNo;
    dm.ADO360.First;
    while not DM.ADO360.Eof do
    begin
      list.Add(DateToStr(dm.ADO360sch_date.Value));
      DM.ADO360.Next;
    end;
    sch_date:=dm.ADO360sch_date.Value;

    dm.ADO360.Append;
    if DayOfTheWeek(sch_date)=6 then
      dm.ADO360sch_date.Value := sch_date+2
    else
      dm.ADO360sch_date.Value := sch_date+1;
    if form5.ShowModal=mrok then
    begin
      qty2:=StrToInt(Form5.DBEdit2.Text);
      for i := 0 to list.Count-1 do
      begin
        if DateToStr(DM.ADO360sch_date.Value)=list.Strings[i] then
        begin
          ShowMessage('不能有相同的完工日期');
          dm.ADO360.Cancel;
          Exit;
        end;
        if qty2 >= qty then
        begin
          ShowMessage('新增的完工计划数量不能大于原完工计划数量');
          DM.ADO360.Cancel;
          Exit;
        end;
      end;
      DM.ADO360so_ptr.Value:=dm.ADO97rkey60.Value;
      DM.ADO360.Post;

      DM.ADO360.RecNo:=r;
      DM.ADO360.Edit;
      DM.ADO360quantity.Value:=qty-qty2;
      DM.ADO360.Post;
    end
    else
      dm.ADO360.Cancel;
  finally
    form5.Free;
    list.Free;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 dm.ADO360.CancelBatch();
end;

procedure TForm2.N3Click(Sender: TObject);
var
  n: Byte;
  rkey360: TDatetime;
  list: TStringList;
begin
  form5:=tform5.Create(application);
  list:=TStringList.Create;
  try
    rkey360:= dm.ADO360.FieldByName('sch_date').AsDatetime;
    dm.ADO360.First;
    while not DM.ADO360.Eof do
    begin
      if dm.ADO360.FieldByName('sch_date').AsDatetime <> rkey360 then
        list.Add(DateToStr(dm.ADO360sch_date.Value));
      DM.ADO360.Next;
    end;

    dm.ADO360.Locate('sch_date',rkey360,[]);
    dm.ADO360.Edit;
    if form5.ShowModal=mrok then
    begin
      if list.Count > 0 then
      begin
        for n:= 0 to list.Count-1 do
        begin
          if DateToStr(DM.ADO360sch_date.Value)=list.Strings[n] then
          begin
            ShowMessage('不能有相同的完工日期');
            dm.ADO360.Cancel;
            Exit;
          end;
        end;
      end;
      dm.ADO360.Post;
    end
    else
      dm.ADO360.Cancel;
  finally
    form5.Free;
    list.Free;
  end;
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  com_qty:integer;
begin
  com_qty:=0;
  dm.ADO360.First;
  while not dm.ADO360.Eof do
  begin
    com_qty:=com_qty+dm.ADO360quantity.Value;
    dm.ADO360.Next;
  end;
  if com_qty<>dm.ADO97PARTS_ORDERED.Value then
  begin
    showmessage('完成数量不等于订单数量,请编辑相等!');
    pagecontrol1.ActivePageIndex:=4;
    dbgrid6.SetFocus;
  end
  else
  begin
    DM.ADO360.UpdateBatch();
    try
      DM.aq_total360.Close;
      DM.aq_total360.Open;
    except
    end;
  end;
end;

procedure TForm2.DateTimePicker2CloseUp(Sender: TObject);
begin
pagecontrol1.ActivePageIndex:=4;
self.DBGrid6.SetFocus;
end;

procedure TForm2.DateTimePicker2Exit(Sender: TObject);
begin
if not dm.ADO360.IsEmpty then
begin
 dm.ADO360.First;
 dm.ADO360.Edit;
 dm.ADO360sch_date.Value:=self.DateTimePicker2.Date;
 dm.ADO360.Post;
end;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  AllFilter;
end;

procedure TForm2.PageControl1Change(Sender: TObject);
begin
  ComboBox1.Visible:=PageControl1.ActivePageIndex=5;
  Label10.Visible:=ComboBox1.Visible;
  rdgttype.Visible:=PageControl1.ActivePageIndex=5;
  rdgGrade.Visible:=PageControl1.ActivePageIndex=5;
end;

procedure TForm2.rdgttypeClick(Sender: TObject);
begin
  AllFilter;
end;

procedure TForm2.AllFilter;
begin
  if ((ComboBox1.ItemIndex = 0) and (rdgttype.ItemIndex = 2) and (rdgGrade.ItemIndex = 2)) then
    DM.aq_total360.Filtered:=false
  else
  if ((ComboBox1.ItemIndex <> 0) and (rdgttype.ItemIndex = 2) and (rdgGrade.ItemIndex = 2)) then
  begin
    DM.aq_total360.Filter:='ABBR_NAME='''+ComboBox1.Items[ComboBox1.ItemIndex]+'''';
    DM.aq_total360.Filtered:=true;
  end
  else
  if ((ComboBox1.ItemIndex = 0) and (rdgttype.ItemIndex <> 2) and (rdgGrade.ItemIndex = 2)) then
  begin
    DM.aq_total360.Filter:='ttype='+IntToStr(rdgttype.ItemIndex);
    DM.aq_total360.Filtered:=true;
  end
  else
  if ((ComboBox1.ItemIndex = 0) and (rdgttype.ItemIndex = 2) and (rdgGrade.ItemIndex <> 2)) then
  begin
    DM.aq_total360.Filter:='difficulty_grade='+IntToStr(rdgGrade.ItemIndex);
    DM.aq_total360.Filtered:=true;
  end
  else
  if ((ComboBox1.ItemIndex = 0) and (rdgttype.ItemIndex <> 2) and (rdgGrade.ItemIndex <> 2)) then
  begin
    DM.aq_total360.Filter:='ttype='+IntToStr(rdgttype.ItemIndex) +' and difficulty_grade='+IntToStr(rdgGrade.ItemIndex);
    DM.aq_total360.Filtered:=true;
  end
  else
  if ((ComboBox1.ItemIndex <> 0) and (rdgttype.ItemIndex <> 2) and (rdgGrade.ItemIndex = 2)) then
  begin
    DM.aq_total360.Filter:='ABBR_NAME='''+ComboBox1.Items[ComboBox1.ItemIndex]+''' and ttype='+IntToStr(rdgttype.ItemIndex);
    DM.aq_total360.Filtered:=true;
  end
  else
  if ((ComboBox1.ItemIndex <> 0) and (rdgttype.ItemIndex = 2) and (rdgGrade.ItemIndex <> 2)) then
  begin
    DM.aq_total360.Filter:='ABBR_NAME='''+ComboBox1.Items[ComboBox1.ItemIndex]+''' and difficulty_grade='+IntToStr(rdgGrade.ItemIndex);
    DM.aq_total360.Filtered:=true;
  end
  else
  begin
    DM.aq_total360.Filter:='ABBR_NAME='''+ComboBox1.Items[ComboBox1.ItemIndex]+''' and ttype='+IntToStr(rdgttype.ItemIndex)+' and difficulty_grade='+IntToStr(rdgGrade.ItemIndex);
    DM.aq_total360.Filtered:=true;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage:=TabSheet5;
  if DM.ADO97.FieldByName('green_flag').Value='1' then
  begin
      dbchkbarcode_flag.Checked:=True;
  end
  else
    begin
      dbchkbarcode_flag.Checked:=False;
   end;
   if DM.ADO97.FieldByName('NOPB_flag').Value='1' then
  begin
      dbchkNOPB_flag.Checked:=True;
  end
  else
    begin
      dbchkNOPB_flag.Checked:=False;
   end;

   if DM.ADO97.FieldByName('CURRENT_REV').Value='1' then
  begin
     dbchkCURRENT_REV.Checked:=True;
  end
  else
    begin
      dbchkCURRENT_REV.Checked:=False;
   end;


end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
  if (DateTimePicker2.Visible) then
  begin
    N1.Enabled:=True;
    N2.Enabled:=True;
    N3.Enabled:=True;
  end else
  begin
    N1.Enabled:=False;
    N2.Enabled:=False;
    N3.Enabled:=False;
  end;
end;

end.
