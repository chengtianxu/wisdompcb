unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB, Menus,OleServer, Excel2000, ComObj,
  ComCtrls,Pick_Item_Single,detail_u, DBClient, Provider;

type
  TFrm_main = class(TForm)
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Grd1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    PopupMenu2: TPopupMenu;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    bbt_1: TBitBtn;
    btn_2: TBitBtn;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit4: TEdit;
    Label6: TLabel;
    bbt_add: TBitBtn;
    bbt_del: TBitBtn;
    bbt_mod: TBitBtn;
    rg1: TRadioGroup;
    BitBtn4: TBitBtn;
    DBGridEh1: TDBGridEh;
    CheckBox1: TCheckBox;
    PopupMenu3: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1ColExit(Sender: TObject);
    procedure pnl_display(flag:Boolean);
    procedure FormShow(Sender: TObject);
    procedure btn_2Click(Sender: TObject);
    procedure pnl_disappear(flag:Boolean);
    procedure bbt_addClick(Sender: TObject);
    procedure bbt_delClick(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure bbt_modClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    FTag : Integer;
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    frmPick_Item : TfrmPick_Item_Single;
    procedure item_click(sender:TObject);
    procedure ExcelToDB;
  public
    de_tmp1 : Integer;
    de_tmp2 : TDateTime;
    de_tmp3 : string;
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
uses common,dm_u,Frm_QrySet_u,delete_detail ,ConstVar;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
var i:integer;
    item:TmenuItem;
begin
 if not App_Init_2(dm.ADOCon) then
  begin
    ShowMsg('程序起动失败,请联系管理员',1);
    application.Terminate;
    exit;
  end; 
  Caption := application.Title;
 {
  dm.ADOCon.Open;
  rkey73:= '96';
  user_ptr := '110';
  vprev := '4';
   }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  for i := 1 to Grd1.Columns.Count do
  begin
        item := TmenuItem.Create(self);
        item.Caption := Grd1.Columns[i - 1].Title.Caption;
        item.Checked := Grd1.Columns[i - 1].Visible;
        item.OnClick := item_click;
        self.PopupMenu2.Items.Add(item);
  end;
  DM.ADOBER.Open;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADOBER.SQL.Text);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADOBER.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADOBER.Sort:=Column.FieldName+' DESC';
  end;
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.BitBtn7Click(Sender: TObject);
var
  i:integer;
begin
  if DM.ADOBER.IsEmpty then exit;
  i := DM.ADOBERrkey.AsInteger ;
  DM.ADOBER.Close;
  DM.ADOBER.Open;
  DM.ADOBER.Locate('rkey',i,[]);
  DM.CDS.Data := DM.DSP.Data;
  DM.ADOBER.FieldByName('sel').ReadOnly:=false;
  DM.CDS.Close;
  DM.CDS.Open;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      Grd1.DataSource.DataSet.Filtered := True;
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else  begin
         Grd1.DataSource.DataSet.Filtered := False;
         Grd1.DataSource.DataSet.Filter:='';
    end;

  end;
end;

procedure TFrm_main.item_click(sender: TObject);
var
  i:integer;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := true;
      break;
    end ;
  end else begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := false;
      break;
    end;
  end;

end;

procedure TFrm_main.BitBtn10Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.BitBtn8Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(Grd1,'宿舍抄表记录');
end;

procedure TFrm_main.BitBtn9Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:= sqlstr + Frm_QrySet.sgrid1.Cells[2,i];
    DM.ADOBER.SQL.Text:=sSql+#13+#13+#13+' where  dbo.Bedroom_equipment_record.oper_time >= '''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and  dbo.Bedroom_equipment_record.oper_time - 1 <='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr+' order by '+ field_name;
   //ShowMessage(DM.ADOBER.SQL.Text);
    DM.ADOBER.Open;
  end;


end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
     self.bbt_addClick(Sender);
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=(vprev='2') or (vprev='4');
  N2.Enabled:=N1.Enabled and not DM.ADOBER.IsEmpty and not DM.ADOBERischecked.Value;
  N3.Enabled:=N2.Enabled and not DM.ADOBERischecked.Value;
  N5.Enabled:= not DM.ADOBER.IsEmpty and not DM.ADOBERischecked.Value;
end;

procedure TFrm_main.ExcelToDB;
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
  QueryTmp:TADOQuery;
begin
    with Tdetail_form.Create(nil) do
    begin
            if showmodal=mrok then
            begin

            end else
            exit;
           // detail_form.Free;
    end;
    limit := 0;
   if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
   Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
        XLApp.DisplayAlerts := False;
        XLApp.Quit;
        VarClear(XLApp);
   end;
   try
        XLApp := CreateOleObject('Excel.Application');
   except
        Screen.Cursor := crDefault;
        Exit;
   end;
   if DM.ADOCon.Connected then
   begin
          try
                 XLApp.workBooks.Open(fileName);
                 Sheet := XLApp.Workbooks[1].WorkSheets[1];
                 DM.ADOBER.DisableControls;
                 QueryTmp :=TADOQuery.Create(Self);
                 QueryTmp.Connection := DM.ADOCon;

                 for iCount:=2 to 65535 do
                 begin
                     if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then  break;

                                      QueryTmp.close;
                                      QueryTmp.sql.Text:=' SELECT  rkey FROM  dbo.Bedroommsg WHERE R_code = ' +trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);
                                      QueryTmp.Open;
                                      if QueryTmp.IsEmpty then
                                      begin
                                                ShowMessage('宿舍编号不存在，批量导入将取消');
                                                Exit;
                                      end;
                 end;

                 for iCount:=2 to 65535 do
                 begin
                     if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then  break;

                                      if not TryStrToFloat(trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]),tmp1) then
                                      begin
                                              ShowMessage('抄表数量数据有误，批量导入将取消');
                                              Exit;
                                      end;
                 end;

                 for iCount:=2 to 65535 do
                 begin
                           if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '') and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
                           begin
                                            try
                                                  DM.ADOBER.Append;
                                                  DM.ADOBER.FieldByName('Sel').AsBoolean := False;
                                                  DM.ADOBER.FieldByName('record_date').Value := de_tmp2;
                                                  DM.ADOBER.FieldByName('record_number').Value := formatfloat('0.00',StrToFloat(trim(XLApp.workbooks[1].sheets[1].cells[iCount,2])));
                                                  if de_tmp1 = 0 then
                                                      DM.ADOBER.FieldByName('type').Value := 'W'
                                                  else if de_tmp1 = 1 then
                                                       DM.ADOBER.FieldByName('type').Value := 'E';
                                                  DM.ADOBER.FieldByName('operator').Value := user_ptr;
                                                  with QueryTmp do
                                                  begin
                                                      close;
                                                      sql.Text:='select getdate() as sys_date, rkey FROM  dbo.Bedroommsg WHERE R_code ='+trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);
                                                      open;
                                                      DM.ADOBER.FieldByName('oper_time').Value := StrToDateTime(fieldvalues['sys_date']);
                                                      DM.ADOBER.FieldByName('roomid').Value := StrToInt(fieldvalues['rkey']);
                                                  end;

                                                  DM.ADOBER.FieldByName('remark').Value := Self.de_tmp3;
                                                  DM.ADOBER.FieldByName('ischecked').Value  := False;
                                                  DM.ADOBER.Post;
                                            except
                                                DM.ADOCon.RollbackTrans;
                                                showmessage('保存数据失败...');
                                            end;
                           end else begin
                                 Inc(limit);
                                 if limit >= 6 then
                                 Break;
                           end;
                 end;
                 XLApp.workbooks[1].close;
           finally
                 XLApp.quit;
                 Screen.Cursor := crDefault;
                 DM.ADOBER.EnableControls;
           end;
   end;
   QueryTmp.Free;
   detail_form.Free;
   Self.BitBtn7Click(nil);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  ExcelToDB
end;

procedure TFrm_main.Grd1ColExit(Sender: TObject);
var
  i : Integer;
begin
  for i :=0 to ComponentCount - 1 do
  begin
     if Self.Components[i] is TEdit then
     TEdit(Components[i]).Enabled := False;
  end;
    Self.rg1.Enabled := False;
    Self.DateTimePicker1.Enabled := False;
    Self.bbt_1.Enabled := False;
    Self.btn_2.Enabled := False;
    Self.BitBtn4.Enabled := False;
    Self.bbt_mod.Enabled := True;
    Self.bbt_del.Enabled := True;
    Self.Edit1.Enabled := True;

    if DM.ADOBER.FieldByName('roomid').AsString = '' then
    begin
      ShowMessage('该行记录为空！');
      DM.ADOBER.Last;
    end
    else
    begin
          if not GroupBox1.Visible then
          begin
             pnl_display(GroupBox1.Visible);
          end;
          if DM.ADOCon.Connected then
          begin
              try
                    Edit2.Hint := DM.ADOBER.FieldByName('roomid').AsString;
                    Edit2.Text := DM.ADOBER.FieldByName('R_code').AsString;
                    Edit3.Text := formatfloat('0.00',DM.ADOBER.FieldByName('record_number').Value);
                    DateTimePicker1.DateTime := DM.ADOBER.FieldByName('record_date').AsDateTime ;
                     if (Trim(dm.ADOBER.FieldByName('type').Value) = 'W') or (Trim(dm.ADOBER.FieldByName('type').Value) = 'w') then
                       rg1.ItemIndex := 0
                    else if (Trim(dm.ADOBER.FieldByName('type').Value) = 'E') or (Trim(dm.ADOBER.FieldByName('type').Value) = 'e') then
                        rg1.ItemIndex := 1;
                    Edit4.Text := DM.ADOBER.FieldByName('remark').AsString;
              except
                  DM.ADOCon.RollbackTrans;
                  showmessage('读取数据失败，请与管理员联系');
              end;
          end;
    end;
    bbt_add.Enabled:=(vprev='2') or (vprev='4');
    bbt_mod.Enabled:=N1.Enabled and not DM.ADOBER.IsEmpty and not DM.ADOBERischecked.Value;
    bbt_del.Enabled:=N2.Enabled and not DM.ADOBERischecked.Value;
end;

procedure TFrm_main.pnl_display(flag:Boolean); //输入当前状态，用来控制pnl_base的显示
begin
    GroupBox1.visible:=not GroupBox1.visible;
    if flag then
    begin
        Grd1.height:=Grd1.Height+GroupBox1.Height;
    end
    else
    begin
        Grd1.Height:=Grd1.Height-GroupBox1.Height;
        GroupBox1.Top:=Grd1.Top+Grd1.Height;
    end;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  GroupBox1.Visible := False;
  Grd1.Height := Grd1.Height + GroupBox1.Height;
  sSql := DM.ADOBER.SQL.Text;
  DBGridEh1.Height := Grd1.Height;
  DBGridEh1.Width := Grd1.Width;
  CheckBox1.Visible := False;
  bbt_del.Enabled := False;
end;

procedure TFrm_main.btn_2Click(Sender: TObject);
begin
  DM.ADOBER.Cancel;
  Self.Grd1ColExit(Sender);
    if GroupBox1.Visible then
    begin
       pnl_disappear(not GroupBox1.Visible);
    end;
end;

procedure TFrm_main.pnl_disappear(flag:Boolean); //输入当前状态，用来控制pnl_base的显示
begin
  GroupBox1.visible:=not GroupBox1.visible;
  if not flag then
    begin
      Grd1.height:=Grd1.Height + GroupBox1.Height;
    end
  else
    begin
      Grd1.Height:=Grd1.Height-GroupBox1.Height;
      GroupBox1.Top:=Grd1.Top+Grd1.Height;
    end;
end;

procedure TFrm_main.bbt_addClick(Sender: TObject);
var
  i : Integer;
  QueryTmp:TADOQuery;
begin
    for i :=0 to ComponentCount - 1 do
    begin
            if Self.Components[i] is TEdit then
            begin
                  TEdit(Components[i]).Enabled := True;
                  TEdit(Components[i]).Text := '';
            end;
    end;

    Self.rg1.Enabled := True;
    Self.DateTimePicker1.Enabled := True;
    Self.bbt_1.Enabled := True;
    Self.btn_2.Enabled := True;
    Self.BitBtn4.Enabled := True;
    Self.bbt_mod.Enabled := False;
    Self.bbt_del.Enabled := False;
    
    FTag := 0;
    QueryTmp:=TADOQuery.Create(Self);
    QueryTmp.Connection := DM.ADOCon;
    with QueryTmp do
    begin
        close;
        sql.Text:='select getdate() as sys_date';
        open;
        DateTimePicker1.DateTime := StrToDateTime(fieldvalues['sys_date']);
    end;
    QueryTmp.Free;
    if GroupBox1.Visible then dm.ADOBER.Cancel
    else pnl_display(GroupBox1.Visible);


end;

procedure TFrm_main.bbt_delClick(Sender: TObject);
var
  i: Integer;
  QueryTmp:TADOQuery;
begin
  if not dm.ADOBER.IsEmpty then
  begin
          if MessageDlg('你确定要删除该抄表记录吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
          begin

                QueryTmp:=TADOQuery.Create(Self);
                QueryTmp.Connection := DM.ADOCon;
                DM.ADOCon.BeginTrans;
                with QueryTmp do
                begin

                    try
                        close;
                        sql.Text:='delete from Bedroom_equipment_record where ischecked = 0 and rkey = '+dm.ADOBERrkey.AsString;
                        if ExecSQL=0 then
                        begin
                              DM.ADOCon.RollbackTrans;
                              showmessage('删除数据失败,数据状态已发生变化...');
                        end else
                              DM.ADOCon.CommitTrans;
                      BitBtn7Click(nil);
                    except
                     DM.ADOCon.RollbackTrans;
                     showmessage('删除数据失败...');
                    end;
                end;
                QueryTmp.Free;
                for i :=0 to ComponentCount - 1 do
                begin
                      if Self.Components[i] is TEdit then
                      TEdit(Components[i]).Text := '';
                end;
          end;
  end
  else Application.MessageBox('当前记录为空','提示', 64);
end;

procedure TFrm_main.bbt_1Click(Sender: TObject);
var
  QueryTmp:TADOQuery;
  fkey1 : Integer;
begin
  if Trim(Edit2.Text) = '' then
  begin
      ShowMessage('宿舍编号不能为空，请填写。');
      Edit2.SetFocus;
      abort;
  end;
  if Trim(Edit3.Text) = '' then
  begin
      ShowMessage('抄表数不能为空，请填写。');
      Edit3.SetFocus;
      abort;
  end;
  if rg1.ItemIndex = -1 then
  begin
      ShowMessage('请选择抄表类型。');
      rg1.SetFocus;
      abort;
  end;

  if DM.ADOCon.Connected then
  begin
        QueryTmp:=TADOQuery.Create(Self);
        QueryTmp.Connection := DM.ADOCon;
        try
              if FTag = 0 then DM.ADOBER.Append
              else DM.ADOBER.Edit;
              DM.ADOCon.BeginTrans;
              DM.ADOBER.FieldByName('roomid').Value := Edit2.Hint;
              DM.ADOBER.FieldByName('record_number').AsFloat := StrToFloat(formatfloat('0.00',StrToFloat(Trim(Edit3.Text))));
              DM.ADOBER.FieldByName('record_date').Value := DateTimePicker1.DateTime;
              if  rg1.ItemIndex = 0 then
                  dm.ADOBER.FieldByName('type').Value := 'W'
              else if rg1.ItemIndex = 1 then
                  dm.ADOBER.FieldByName('type').Value := 'E';
             // DM.ADOBER.FieldByName('operator').Value := StrToInt(rkey73);
              with QueryTmp do
              begin
                  close;
                  sql.Text:='select getdate() as sys_date';
                  open;
                  DM.ADOBER.FieldByName('oper_time').Value := StrToDateTime(fieldvalues['sys_date']);
              end;
              with QueryTmp do
              begin
                  close;
                  sql.Text:='select EMPLOYEE_PTR from data0073 where rkey = '+rkey73+#13+#13;
                  open;
                  DM.ADOBER.FieldByName('operator').Value := FieldByName('EMPLOYEE_PTR').AsInteger;
              end;
              DM.ADOBER.FieldByName('remark').Value := Trim(Edit4.Text);
              DM.ADOBER.FieldByName('ischecked').Value  := False;
              DM.ADOBER.Post;
              DM.ADOCon.CommitTrans;
              fkey1 := DM.ADOBER.FieldByName('rkey').asinteger;
        except
            DM.ADOCon.RollbackTrans;
            showmessage('保存数据失败...');
        end;
        Self.BitBtn7Click(nil);
        self.bbt_addClick(Sender);
        DM.ADOBER.Close;
        DM.ADOBER.Open;
        DM.ADOBER.Locate('rkey',fkey1,[]);
  end;
  QueryTmp.Free;
end;

procedure TFrm_main.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
  if (key='.') and (Pos('.',(Sender as TEdit).Text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TFrm_main.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin

    frmPick_Item := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'R_code/宿舍编号/100,bedcount/床位数量/100,'+
                        'floor/所在楼层/100,type/类型/80,D_name/宿舍楼名称/100';
    InputVar.Sqlstr :=
    'SELECT     dbo.Bedroommsg.rkey, dbo.Bedroommsg.R_code, dbo.Bedroommsg.bedcount, dbo.Dormitorymsg.D_name, CONVERT(char(2), dbo.Bedroommsg.floor) + '''+'楼'+''' AS floor, '+#13+
    ' CASE dbo.Bedroommsg.type WHEN 0 THEN '''+'女宿舍'+''' WHEN 1 THEN '''+'男宿舍'+''' WHEN 2 THEN '''+'家庭宿舍'+''' END AS type '+#13+
    ' FROM  dbo.Bedroommsg INNER JOIN dbo.Dormitorymsg ON dbo.Bedroommsg.dormitoryid = dbo.Dormitorymsg.rkey'+#13;
    try
        inputvar.KeyField :='R_code';
        InputVar.AdoConn := dm.ADOCon;
        frmPick_Item.InitForm_New(InputVar);
        if frmPick_Item.ShowModal=mrok then
        begin
            edit2.Text := trim(frmPick_Item.adsPick.FieldValues['R_code']);
            edit2.Hint := trim(frmPick_Item.adsPick.FieldValues['rkey']);
        end;
    finally
        frmPick_Item.adsPick.Close;
        frmPick_Item.Free ;
    end;
end;

procedure TFrm_main.bbt_modClick(Sender: TObject);
var
  i : Integer;
begin
    for i :=0 to ComponentCount - 1 do
    begin
            if Self.Components[i] is TEdit then
            begin
                  TEdit(Components[i]).Enabled := True;
            end;
    end;

    Self.rg1.Enabled := True;
    Self.DateTimePicker1.Enabled := True;
    Self.bbt_1.Enabled := True;
    Self.btn_2.Enabled := True;
    Self.BitBtn4.Enabled := True;
    FTag := 1;
end;

procedure TFrm_main.N2Click(Sender: TObject);
begin
    Self.bbt_modClick(Sender);
end;

procedure TFrm_main.N3Click(Sender: TObject);
begin
     Self.bbt_delClick(Sender);
end;

procedure TFrm_main.N5Click(Sender: TObject);
var
  QueryTmp:TADOQuery;
begin

  if not dm.ADOBER.IsEmpty then
  begin
          if MessageDlg('复核该抄表记录不可反操作，请确认各项记录都正确',mtConfirmation,[mbYes,mbNo],0)=mrYes then
          begin

                QueryTmp:=TADOQuery.Create(Self);
                QueryTmp.Connection := DM.ADOCon;
                DM.ADOCon.BeginTrans;
                with QueryTmp do
                begin

                    try
                        close;
                        sql.Text:='update Bedroom_equipment_record set ischecked = 1 where ischecked = 0 and rkey = '+dm.ADOBERrkey.AsString;
                        if ExecSQL=0 then
                        begin
                              DM.ADOCon.RollbackTrans;
                              showmessage('更新数据失败,数据状态已发生变化...');
                        end else
                              DM.ADOCon.CommitTrans;
                      BitBtn7Click(nil);
                    except
                       DM.ADOCon.RollbackTrans;
                       showmessage('更新数据失败...');
                    end;
                end;
                QueryTmp.Free;
          end;
  end
  else Application.MessageBox('当前记录为空','提示', 64);
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
var
    i : Integer;
begin
   if BitBtn2.Caption = '批量操作' then
   begin
         BitBtn2.Caption := '取消';
         Grd1.Visible := False;
         DBGridEh1.Visible := True;
         GroupBox1.Visible := False;
         for i :=0 to ComponentCount - 1 do
         if Self.Components[i] is TBitBtn then
         begin
            TBitBtn(Components[i]).Enabled := False;
         end;
         Edit1.Enabled := False;
         BitBtn2.Enabled := True;
         BitBtn6.Enabled := True;
         BitBtn1.Visible := False;
         BitBtn8.Visible := False;
         CheckBox1.Visible := True;
         DBGridEh1.Width := Frm_main.Width-2;
         DBGridEh1.Height:= Frm_main.Height - Panel2.Height-28;
         //Frm_main.Height:=DBGridEh1.Height + Panel2.Height;
         DM.CDS.Data := DM.DSP.Data;
         DM.ADOBER.FieldByName('sel').ReadOnly:=false;
         DM.CDS.Close;
         DM.CDS.Open;
         if DM.CDS.State in [dsEdit,dsInsert] then DM.CDS.Post;
   end else if BitBtn2.Caption = '取消' then
   begin
         BitBtn2.Caption := '批量操作';
         for i :=0 to ComponentCount - 1 do
         if Self.Components[i] is TBitBtn then
         begin
            TBitBtn(Components[i]).Enabled := True;
         end;
         Edit1.Enabled := True;
         bbt_mod.Enabled := False;
         Grd1.Visible := true;
         DBGridEh1.Visible := False;
         GroupBox1.Visible := False;
         CheckBox1.Visible := False;
         BitBtn1.Visible := True;
         BitBtn8.Visible := True;
         Grd1.Width := Frm_main.Width-2;
         Grd1.Height:= Frm_main.Height - Panel2.Height-28;
         DM.CDS.Data := DM.DSP.Data;
         DM.ADOBER.FieldByName('sel').ReadOnly:=false;
         DM.CDS.Close;
         DM.CDS.Open;
         if DM.CDS.State in [dsEdit,dsInsert] then DM.CDS.Post;
   end;
   Self.BitBtn7Click(nil);
end;

procedure TFrm_main.CheckBox1Click(Sender: TObject);
begin
  DM.CDS.DisableControls;
  screen.Cursor:=crHourGlass;
  DM.CDS.First;
  if CheckBox1.Checked then
  while not DM.CDS.Eof do
  begin
    DM.CDS.Edit;
    DM.CDS.FieldByName('sel').AsBoolean:=true;
    DM.CDS.Post;
    DM.CDS.Next;
  end
  else
  while not DM.CDS.Eof do
  begin
    DM.CDS.Edit;
    DM.CDS.FieldByName('sel').AsBoolean:=false;
    DM.CDS.Post;
    DM.CDS.Next;
  end ;
  DM.CDS.EnableControls;
  screen.Cursor:=crDefault;
  //Self.BitBtn7Click(nil);
end;

procedure TFrm_main.N6Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
  begin
       Self.N6.Caption := '全部取消';
       CheckBox1.Checked := True;
  end else
  if  CheckBox1.Checked then
  begin
       Self.N6.Caption := '全选';
       CheckBox1.Checked := False;
  end ;

end;

procedure TFrm_main.N8Click(Sender: TObject);
var
    QueryTmp:TADOQuery;
begin
  if MessageBox(Handle,'确定批量删除吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  if DM.ADOCon.Connected then
  begin
              if DM.CDS.State in [dsEdit,dsinsert] then DM.CDS.Post;
              DM.CDS.AfterScroll:=nil;
              DM.CDS.DisableControls;
              DM.CDS.Filtered:=false;
              DM.CDS.First;
              screen.Cursor:=crHourGlass;
              QueryTmp:=TADOQuery.Create(Self);
              QueryTmp.Connection := DM.ADOCon;
              while not DM.CDS.Eof do
              begin
                    if DM.CDS.FieldByName('Sel').AsBoolean and DM.CDS.FieldByName('ischecked').AsBoolean then
                    begin
                          showmessage('所选项中有已复核状态，不可以删除...');
                          screen.Cursor:=crDefault;
                          DM.CDS.EnableControls;
                          Exit;
                    end;
                     DM.CDS.Next;
              end;
              DM.CDS.First;
              while not DM.CDS.Eof do
              begin
                    if DM.CDS.FieldByName('Sel').AsBoolean then
                    begin
                          DM.ADOCon.BeginTrans;
                          try
                                QueryTmp.Close;
                                QueryTmp.SQL.Clear;
                                QueryTmp.SQL.Text:='delete from Bedroom_equipment_record where ischecked = 0 and rkey= '+DM.CDS.FieldByName('rkey').AsString+#13+#13;
                                      if QueryTmp.ExecSQL = 0 then
                                      begin
                                            DM.ADOCon.RollbackTrans;
                                            showmessage('删除数据失败,数据状态已发生变化...');
                                      end else
                                      DM.ADOCon.CommitTrans;
                          except
                             DM.ADOCon.RollbackTrans;
                             showmessage('删除数据失败...');
                          end;
                    end;
                    DM.CDS.Next;
              end;
  
  end;
  showmessage('删除成功');
  screen.Cursor:=crDefault;
  DM.CDS.EnableControls;
  Self.BitBtn7Click(nil);
  Self.BitBtn2Click(nil);
  QueryTmp.Free;
end;

procedure TFrm_main.N9Click(Sender: TObject);
var
    tmp1: Integer;
    tmp2,tmp7 : TDateTime;
    tmp3,tmp4,tmp5,tmp6 : String;
    QueryTmp : TADOQuery;
begin
  if MessageBox(Handle,'确定批量编辑吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
  begin
       exit;
  end;


  if DM.ADOCon.Connected then
  begin
            if DM.CDS.State in [dsEdit,dsinsert] then DM.CDS.Post;
            DM.CDS.AfterScroll:=nil;
            DM.cds.DisableControls;
            DM.CDS.Filtered:=false;
            DM.CDS.First;
            screen.Cursor:=crHourGlass;
            QueryTmp:=TADOQuery.Create(Self);
            QueryTmp.Connection := DM.ADOCon;

              while not DM.CDS.Eof do
              begin
                    if DM.CDS.FieldByName('Sel').AsBoolean and DM.CDS.FieldByName('ischecked').AsBoolean then
                    begin
                          showmessage('所选项中有已复核状态，不可以编辑...');
                          screen.Cursor:=crDefault;
                          DM.CDS.EnableControls;
                          Exit;
                    end;
                     DM.CDS.Next;
              end;

              with Tdetail_form.Create(nil) do
              begin
                        if showmodal=mrok then
                        begin

                        end else
                        begin
                          screen.Cursor:=crDefault;
                          DM.CDS.EnableControls;
                          Exit;
                        end;

                        //detail_form.Free;
              end;
              with QueryTmp do
              begin
                    close;
                    SQL.Clear;
                    sql.Text:='select getdate() as sys_date';
                    open;
                    tmp7 := FieldByName('sys_date').AsDateTime;
              end;
              tmp6 := DateToStr(tmp7);
              tmp5 := DateToStr(tmp2);
              if de_tmp1 = 0 then
                tmp4 := 'W'
              else if de_tmp1 = 1 then
                tmp4 := 'E';
              DM.CDS.First;
              while not DM.CDS.Eof do
              begin
                    if DM.CDS.FieldByName('Sel').AsBoolean then
                    begin
                          DM.ADOCon.BeginTrans;
                          try
                                QueryTmp.Close;
                                QueryTmp.SQL.Clear;
                                QueryTmp.SQL.Text:='update Bedroom_equipment_record set '+
                                'record_date = '''+datetostr(de_tmp2)+''' , type = '''+tmp4+''',operator = '+ user_ptr+
                                ', oper_time = '''+tmp6+''' ,remark = '''+de_tmp3+''''+
                                ' where ischecked = 0 and rkey= '+DM.CDS.FieldByName('rkey').AsString+#13+#13;
                                      if QueryTmp.ExecSQL = 0 then
                                      begin
                                            DM.ADOCon.RollbackTrans;
                                            showmessage('更新数据失败,数据状态已发生变化...');
                                      end else
                                      DM.ADOCon.CommitTrans;
                          except
                             DM.ADOCon.RollbackTrans;
                             showmessage('更新数据失败...');
                          end;
                    end;
                    DM.CDS.Next;
              end;
  end;
  showmessage('更新成功');
  screen.Cursor:=crDefault;
  Self.BitBtn7Click(nil);
  Self.BitBtn2Click(Sender);
  DM.CDS.EnableControls;
  QueryTmp.Free;
  detail_form.Free;
end;

procedure TFrm_main.N10Click(Sender: TObject);
var
    i: Integer;
    QueryTmp:TADOQuery;
begin
  if MessageBox(Handle,'确定批量复核吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  if DM.ADOCon.Connected then
  begin

            if DM.CDS.State in [dsEdit,dsinsert] then DM.CDS.Post;
            DM.CDS.AfterScroll:=nil;
            DM.CDS.DisableControls;
            DM.CDS.Filtered:=false;
            DM.CDS.First;
            i:=Grd1.RowCount-1;
            screen.Cursor:=crHourGlass;
            QueryTmp:=TADOQuery.Create(Self);
            QueryTmp.Connection := DM.ADOCon;
            while not DM.CDS.Eof do
            begin
                  if DM.CDS.FieldByName('Sel').AsBoolean and DM.CDS.FieldByName('ischecked').AsBoolean then
                  begin
                        showmessage('所选项中有已复核状态，不可以复核...');
                        screen.Cursor:=crDefault;
                        DM.CDS.EnableControls;
                        Exit;
                  end;
                   DM.CDS.Next;
            end;
            DM.CDS.First;
            while not DM.CDS.Eof do
            begin
                  if DM.CDS.FieldByName('Sel').AsBoolean then
                  begin
                        DM.ADOCon.BeginTrans;
                        try
                              QueryTmp.Close;
                              QueryTmp.SQL.Clear;
                              QueryTmp.SQL.Text:='update Bedroom_equipment_record set  ischecked = 1 where ischecked = 0 and rkey= '+DM.CDS.FieldByName('rkey').AsString+#13+#13;
                                    if QueryTmp.ExecSQL = 0 then
                                    begin
                                          DM.ADOCon.RollbackTrans;
                                          showmessage('更新数据失败,数据状态已发生变化...');
                                    end else
                                    DM.ADOCon.CommitTrans;
                        except
                           DM.ADOCon.RollbackTrans;
                           showmessage('更新数据失败...');
                        end;
                  end;
                  DM.CDS.Next;
            end;
  end;
  showmessage('批量复核成功');
  screen.Cursor:=crDefault;
  DM.CDS.EnableControls;
  Self.BitBtn7Click(nil);
  Self.BitBtn2Click(nil);
  QueryTmp.Free;
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DM.ADOBERischecked.AsBoolean = True then
     Grd1.Canvas.Font.Color := clGrayText;
     Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFrm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
     if DM.CDS.FieldByName('ischecked').AsBoolean = True then
     DBGridEh1.Canvas.Font.Color := clGrayText;
     DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
