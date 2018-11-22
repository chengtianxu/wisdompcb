unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask, DBCtrls,
  Menus,adodb, DB,ComObj, Excel97, ExtCtrls, ppCtrls, ppBands, ppPrnabl,
  ppClass, ppVar, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppEndUsr,raide;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    N13: TMenuItem;
    Panel1: TPanel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    Bar1: TStatusBar;
    Splitter1: TSplitter;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    rdgType: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuItem1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdgTypeClick(Sender: TObject);
  private
    v_employee:integer;
    OldGridWnd : TWndMethod;
    procedure NewGridWnd (var Message : TMessage);
  public
    system_date,sys_shortdate :tdatetime;
  end;

var
  Form1: TForm1;

implementation

uses damo, edit_req, auth_info, received, addedit_requ, supplier_search, empl_search, common;

{$R *.dfm}

procedure TForm1.NewGridWnd(var Message: TMessage);
var
  IsNeg: Boolean;
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.N3Click(Sender: TObject); //检查
begin
  try
    dm.adowz300.Close;
    dm.adowz300.Parameters[0].Value := dm.wzdata300rkey.Value;
    dm.adowz300.Open;
    form2:=tform2.Create(application);
    form2.BitBtn9.Visible := true;
    form2.BitBtn1.Visible := false;
    form2.BitBtn3.Visible := false;

    form2.Edit1.Enabled := false;
    form2.BitBtn4.Enabled := false;
    form2.Edit2.Enabled := false;
    form2.BitBtn5.Enabled := false;
    form2.Edit4.Enabled := false;
    form2.BitBtn7.Enabled := false;
    form2.BitBtn8.Enabled := false;
    form2.Edit5.Enabled := false;

    form2.DBEdit1.Enabled:=false;
    form2.DBEdit2.Enabled := false;
    form2.DBEdit3.Enabled:=false;
    form2.DBEdit4.Enabled:=false;
    form2.DBEdit5.Enabled:=false;
    form2.DBEdit6.Enabled:=false;
    form2.DBEdit7.Enabled:=false;
    form2.DBEdit8.Enabled:=false;
    form2.DBEdit9.Enabled:=false;

    form2.DBGrid1.PopupMenu := form2.PopupMenu3;
    if rdgType.ItemIndex = 0 then  //半制程
    begin
      form2.pnlProc.Visible:= True;
      form2.DBGrid1.Columns[4].Visible:= False;
      form2.DBGrid1.Columns[5].Visible:= False;
    end
    else                           //全制程
    begin
      form2.pnlProc.Visible:= False;
      form2.DBGrid1.Columns[4].Visible:= True;
      form2.DBGrid1.Columns[5].Visible:= True;
    end;
    form2.ShowModal;
  finally
    form2.free;
  end;
end;

procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  v_bar:string;
begin
  if Key = Chr(vk_Back) then       //如果按下了backspace
  begin
    if length(bar1.SimpleText)>5 then
      bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
    if length(bar1.SimpleText)>5 then
    begin
      v_bar :=copy(bar1.SimpleText,6,length(bar1.SimpleText));
      dm.wzdata300.Filter := 'epiboly_number like '''+trim(v_bar)+'%'''
    end
    else
     dm.wzdata300.Filter :='';
  end
  else
  if (ord(key)<>13) and (ord(key)<>32) then
  begin
    bar1.SimpleText := bar1.SimpleText+key;
    v_bar :=copy(bar1.SimpleText,6,length(bar1.SimpleText));
    dm.wzdata300.Filter := 'epiboly_number like '''+trim(v_bar)+'%'''
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
  end;
  Caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if dm.ADOConnection1.Connected then
  begin
    with dm.ADOQuery1 do
    begin
      active:=false;
      sql.Clear;
      sql.Add('select getdate() as v_dt');
      active:=true;
      system_date := fieldvalues['v_dt']; //长格式
      sys_shortdate := strtodate(datetostr(system_date));
    end;
    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select employee_ptr,data0034.dept_code,data0034.dept_name');
      sql.Add('from data0073,data0005,data0034');
      sql.Add('where data0073.employee_ptr=data0005.rkey');
      sql.Add('and data0005.EMPLOYEE_ID=data0034.rkey');
      sql.Add('and data0073.rkey='+rkey73);
      open;
      v_employee:=fieldvalues['employee_ptr'];
    end;
    dm.wzdata300.Close;
    dm.wzdata300.Parameters[0].Value :=rkey73;
    dm.wzdata300.Open;
    rdgType.ItemIndex:=0;
    rdgTypeClick(nil);
    dm.ado301.open;
  end;
end;

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
  dbgrid1.SetFocus;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  try
    form6 := tform6.Create(application);
    dm.Aqwz302.Open;
    form6.ShowModal;
  finally
    dm.Aqwz302.Close;
    form6.Free;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if combobox1.ItemIndex=0 then
  try
    Form_supp:=tForm_supp.Create(application);
    Form_supp.Edit1.Text := trim(edit1.Text);
    if Form_supp.ADOQuery1.IsEmpty then
    begin
      messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
      edit1.SetFocus;
    end
    else
    if Form_supp.ShowModal=mrok then
    begin
      edit1.Text := Form_supp.ADOQuery1CODE.Value;
      edit1.Font.Color := clwindowtext;
      label10.Caption := Form_supp.ADOQuery1ABBR_NAME.Value;
      with dm.wzdata300 do
      begin
        close;
        sql.Delete(sql.Count-3);
        sql.Insert(sql.Count-2,'and WZDATA300.supp_ptr='+form_supp.ADOQuery1rkey.AsString);
        open;
      end;
      dbgrid1.SetFocus;
    end
    else
      edit1.SetFocus;
  finally
    Form_supp.free;
  end
  else
  try
    form_technics:=Tform_technics.Create(application);
    form_technics.Edit1.Text := trim(edit1.Text);
    if form_technics.ADOQuery1.IsEmpty then
    begin
      messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
      edit1.SetFocus;
    end
    else
    if form_technics.ShowModal=mrok then
    begin
      edit1.Text := form_technics.ADOQuery1DEPT_CODE.Value;
      edit1.Font.Color := clwindowtext;
      label10.Caption := form_technics.ADOQuery1DEPT_NAME.Value;
      with dm.wzdata300 do
      begin
        close;
        sql.Delete(sql.Count-2);
        sql.Insert(sql.Count-1,'and WZDATA300.dept_ptr='+form_technics.ADOQuery1rkey.AsString);
        open;
      end;
      dbgrid1.SetFocus;
    end
    else
      edit1.SetFocus;
  finally
    form_technics.free;
  end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  if combobox1.ItemIndex=0 then
  if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2') and (trim(edit1.Text)<>'') then
  try
    Form_supp:=tForm_supp.Create(application);
    Form_supp.Edit1.Text := trim(edit1.Text);
    if comparetext(trim(edit1.text),trim(Form_supp.ADOQuery1code.AsString))=0 then
    begin
      edit1.Font.Color := clwindowtext;
      label10.Caption := Form_supp.ADOQuery1abbr_name.Value;
      with dm.wzdata300 do
      begin
        close;
        sql.Delete(sql.Count-3);
        sql.Insert(sql.Count-2,'and WZDATA300.supp_ptr='+form_supp.ADOQuery1rkey.AsString);
        open;
      end;
    end
    else
    begin
      messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      label10.Caption := '';
      edit1.SetFocus;
    end;
  finally
    Form_supp.Free;
  end
  else
  if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2') and (trim(edit1.Text)='') then
    with dm.wzdata300 do
    begin
      close;
      sql.Delete(sql.Count-3);
      sql.Insert(sql.Count-2,'');
      open;
      label10.Caption:='';
    end
  else
  else
  if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2') and (trim(edit1.Text)<>'') then
  try
    form_technics:=tform_technics.Create(application);
    form_technics.Edit1.Text := trim(edit1.Text);
    if comparetext(trim(edit1.text),trim(form_technics.ADOQuery1DEPT_CODE.Value))=0 then
    begin
     edit1.Font.Color := clwindowtext;
     label10.Caption := form_technics.ADOQuery1DEPT_NAME.Value;
     with dm.wzdata300 do
      begin
       close;
       sql.Delete(sql.Count-2);
       sql.Insert(sql.Count-1,'and WZDATA300.dept_ptr='+form_technics.ADOQuery1rkey.AsString);
       open;
      end;
    end
    else
    begin
      messagedlg('外发工序代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      label10.Caption := '';
      edit1.SetFocus;
    end;
  finally
    form_technics.Free;
  end
  else
  if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2') and (trim(edit1.Text)='') then
  begin
    label10.Caption := '';
    with dm.wzdata300 do
    begin
      close;
      sql.Delete(sql.Count-2);
      sql.Insert(sql.Count-1,'');
      open;
      label10.Caption:='';
    end
  end;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then dbgrid1.SetFocus;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  if not dm.wzdata300.isempty then n3click(sender);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then dbgrid1dblclick(sender);
end;


procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  if not dm.ado301.isempty then
  try
    form3:=tform3.Create(application);
    with form3 do
    begin
      DateTimePicker1.Date:=dm.ADO301REQ_DATE.Value;
      DateTimePicker1.Enabled:=false;
      BitBtn3.Enabled:=false;
      dbcombobox1.Enabled:=false;
      dbcombobox2.Enabled:=false;
      dbedit1.Enabled := false;
      dbedit3.Enabled := false;
      dbedit4.Enabled := false;
      dbedit5.enabled := false;
      dbedit6.enabled := false;
      dbedit7.Enabled := false;
      dbedit8.enabled := false;
      dbedit9.enabled := false;

      button1.Visible:=false;
      button2.Visible:=false;
      button3.Visible:=true;
    end;
    form3.ShowModal;
  finally
    form3.free;
  end;
end;

procedure TForm1.N13Click(Sender: TObject);
var
  bm: TBookmark;
  col, row: Integer;
  sline: String;
  mem: TMemo;
  ExcelApp: Variant;
begin
  Screen.Cursor := crHourglass;
  dbgrid2.DataSource.DataSet.DisableControls;
  bm := dbgrid2.DataSource.DataSet.GetBookmark;
  dbgrid2.DataSource.DataSet.First;

  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
  ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

  mem := TMemo.Create(Self);
  mem.Visible := false;
  mem.Parent := Form1;
  mem.Clear;
  sline := '';

  for col := 0 to dbgrid1.FieldCount-1 do
    sline := sline + dbgrid1.Columns[col].Title.Caption + #9;
  mem.Lines.Add(sline);

  sline := '';
  for col := 0 to dbgrid1.FieldCount-1 do
    sline := sline + dbgrid1.Fields[col].AsString + #9;
  mem.Lines.Add(sline);            //导出请购编号

  mem.Lines.Add('');//增加一行空行

  sline := '';
  for col := 0 to dbgrid2.FieldCount-1 do
    sline := sline + dbgrid2.Columns[col].Title.Caption + #9;
  mem.Lines.Add(sline);

  for row := 0 to dbgrid2.DataSource.DataSet.RecordCount-1 do
  begin
    sline := '';
    for col := 0 to dbgrid2.FieldCount-1 do
      sline := sline + dbgrid2.Fields[col].AsString + #9;
    mem.Lines.Add(sline);
    dbgrid2.DataSource.DataSet.Next;
  end;

  sline := '';

  mem.SelectAll;
  mem.CopyToClipboard;

  ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
  ExcelApp.Visible := true;
  FreeAndNil(mem);

  dbgrid2.DataSource.DataSet.GotoBookmark(bm);
  dbgrid2.DataSource.DataSet.FreeBookmark(bm);
  dbgrid2.DataSource.DataSet.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  v_rkey: integer;
begin
  v_rkey := 0;
  if not dm.wzdata300.IsEmpty then v_rkey := dm.wzdata300rkey.Value;
  dm.wzdata300.Close;
  dm.wzdata300.Open;
  if v_rkey > 0 then dm.wzdata300.Locate('rkey',v_rkey,[]);
end;

procedure TForm1.N2Click(Sender: TObject);
var
  str:string;
begin
  if inputquery('审批信息','请输入审批信息           ',str) then
  begin
    dm.wzdata300.edit;
    dm.wzdata300auth_date.value := system_date;
    dm.wzdata300remark.value := str;
    dm.wzdata300auth_flag.value := 'N';
    dm.adowz302.open;
    if dm.adowz302.isempty then  //没有其它人需要审批了
      dm.wzdata300status.value := 3
    else                         //还有比当前用户高一级的审批人员
    begin
      dm.adowz302.edit;
      dm.ADOwz302auth_flag.value := 'Y';
      dm.adowz302.post;
    end;
    dm.wzdata300.post;
  end;
end;

procedure TForm1.N10Click(Sender: TObject);
var
  str:string;
begin
  if inputquery('取消评审','请输入取消评审信息           ',str) then
  begin
    dm.wzdata300.edit;
    dm.wzdata300auth_date.AsVariant := null;
    dm.wzdata300remark.value := str;
    dm.wzdata300auth_flag.value := 'Y';

    dm.adowz302.open;
    if dm.adowz302.isempty then  //没有其它人需要审批了
      dm.wzdata300status.value:=2
    else                         //还有比当前用户高一级的审批人员
    begin
      dm.adowz302.edit;
      dm.ADOwz302auth_flag.value := 'N';
      dm.adowz302.post;
    end;

    dm.wzdata300.post;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  if dm.wzdata300.isempty then
  begin
    n2.enabled := false;
    n3.enabled := false;
    n10.enabled := false;
    n12.enabled := false;
    n9.enabled := false;
    n13.enabled := false;
  end
  else
  begin
    n3.enabled := true;
    n9.enabled := true;
    n13.enabled := true;
    if dm.wzdata300auth_date.AsVariant = null then    //未审批
    begin
      n2.enabled := true;
      n10.enabled := false;
      if dm.wzdata300status.value=2 then
        n12.enabled := true
      else
        n12.enabled := false;
    end
    else                //已审批
    begin
      n2.enabled:=false;
      n10.enabled:=true;
      n12.enabled:=false;
    end;
  end;
end;

procedure TForm1.N12Click(Sender: TObject);
var
  str:string;
begin
  if inputquery('评审退回','请输入退回信息           ',str) then
  begin
    dm.wzdata300.edit;
    dm.wzdata300status.value:=5;
    dm.wzdata300remark.value := str;
    dm.wzdata300.post;
  end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if dm.wzdata300status.value=5 then DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.rdgTypeClick(Sender: TObject);
begin
  if DM.wzdata300.Active then
  begin
    dm.wzdata300.Filter:='type='+IntToStr(rdgType.ItemIndex);
    dm.wzdata300.Filtered:=True;
    if rdgType.ItemIndex = 0 then   //半制程
    begin
      DBGrid1.Columns[1].Visible:= True;
      DBGrid2.Columns[4].Visible:= False;
      DBGrid2.Columns[5].Visible:= False;
    end
    else                            //全制程
    begin
      DBGrid1.Columns[1].Visible:= False;
      DBGrid2.Columns[4].Visible:= True;
      DBGrid2.Columns[5].Visible:= True;
    end;
  end;
end;

end.
