unit update_inv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls,
  Menus, DB, ADODB,ComObj, Excel2000, ExtCtrls,ClipBrd;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    Bar1: TStatusBar;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Label7: TLabel;
    Edit1: TEdit;
    BitBtn5: TBitBtn;
    Label8: TLabel;
    N10: TMenuItem;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    Label6: TLabel;
    DBText2: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    N11: TMenuItem;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Click(Sender: TObject);
  private
    { Private declarations }
    group_ptr:integer;
   OldGridWnd: TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
 uses damo, device_inv, new_inv, invtype_search, main, note_information,
  inv_serach;
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

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.N2Click(Sender: TObject);   //编辑
var
bar_text:string;
begin
 if (strtoint(form1.vprev.Caption)=1) or (strtoint(form1.vprev.Caption)=3) then
  showmessage('对不起您只有该程序的只读权限!')
 else
 try
  bar_text:=bar1.SimpleText;
  dm.ADO0017.Open;
  dm.AQ17.Edit;
  if dm.ado496if_flag.Value=0 then
   dm.AQ17INV_PART_NUMBER.EditMask:=dm.ado496mask_inv_number.Value;
  hide;
  form3:=tform3.Create(application);
  form3.ShowModal;
  bar1.SimpleText:=bar_text+' ';
  bar1.SimpleText:=trim(bar1.SimpleText);
 finally
  form3.free;
  dm.AQ17INV_PART_NUMBER.EditMask:='';
  dm.ADO0017.Close;
 end;
end;

procedure TForm2.N1Click(Sender: TObject);      //新增
 var
  rkey17:integer;
  bar_text,v_filter:string;
begin
 if (strtoint(form1.vprev.Caption)=1) or (strtoint(form1.vprev.Caption)=3) then
  showmessage('对不起您只有该程序的只读权限!')
 else
 TRY
  if not dm.AQ17.Active then
   with dm.AQ17 do
    begin
     close;
     sql.Delete(1);
     sql.Insert(1,'where rkey is null');
     open;
    end;

  rkey17:=dm.AQ17RKEY.Value;
  v_filter:=dm.AQ17.Filter;  //保存过滤条件
  bar_text:=bar1.SimpleText; //保存提示
  dm.AQ17.Filter :='';       //取消过滤

  DM.AQ17.Append;
  hide;

  form4:=tform4.Create(application);
  form4.v_moth:=true;
  if form4.ShowModal=mrok then
   try
    dm.AQ17.Refresh;
    dm.AQ17.Edit;
    form3:=tform3.Create(application);
    form3.Label50.Caption := '1';  //开始编辑,注明是刚新增完后的
    form3.ShowModal;
    bar1.SimpleText:='搜索:  ';
    bar1.SimpleText:=trim(bar1.SimpleText);
   finally
    form3.free;
    dm.AQ17INV_PART_NUMBER.EditMask:='';
   end
  ELSE
   begin
    if rkey17>0 then dm.AQ17.Locate('rkey',rkey17,[]);
    dm.AQ17.Filter:=v_filter;
    bar1.SimpleText := bar_Text+' ';
    bar1.SimpleText:=trim(bar1.SimpleText);
   end;
 finally
  form4.free;
 end;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
 if (strtoint(form1.vprev.Caption)=1) or (strtoint(form1.vprev.Caption)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end;

 if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
   dm.ADOConnection1.BeginTrans;
   with dm.AQ1711 do                        //读取记事本
    begin
     active:=false;
     Parameters[0].Value:=dm.AQ17RKEY.Value;
     active:=true;
     if not isempty then
     delete;
    end;
   try
    dm.AQ17.Delete;
   except
    dm.ADOConnection1.RollbackTrans;
    exit;
   end;
   try
    dm.ADOConnection1.CommitTrans;
   except
    dm.ADOConnection1.RollbackTrans;
   end;
  end;
end;

procedure TForm2.N3Click(Sender: TObject);   //复制
var
 v_recode:array[1..82] of variant;
 i:word;
 bk:Tbookmark;
 bar_text,v_filter:string;
begin
 if (strtoint(form1.vprev.Caption)=1) or (strtoint(form1.vprev.Caption)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end;
 for i:=1 to 82 do
  v_recode[i]:=dm.AQ17.Fields[i].Value;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select rkey,whouse_ptr,invent_ptr,min_stock,max_stock,reorder_point,');
   sql.Add('location_ptr1,location_ptr2,location_ptr3,location_ptr4,location_ptr5');
   sql.Add('from data0018');
   sql.Add('where invent_ptr='+dm.AQ17RKEY.AsString);
   active:=true;
  end;
 bk:=dm.AQ17.GetBookmark();
 v_filter:=dm.AQ17.Filter;
 bar_text:=bar1.SimpleText;
 dm.AQ17.Filter :='';
 hide;
 dm.AQ17.Append;
 for i:=1 to 82 do
  dm.AQ17.fieldvalues[dm.AQ17.Fields[i].FieldName]:=v_recode[i];
 dm.AQ18.Close;
 dm.AQ18.Parameters[0].Value :=null;
 dm.AQ18.Open;
 while not dm.ADOQuery1.Eof do
  begin
   dm.AQ18.Append;
   for i:=1 to 10 do
    dm.AQ18.FieldValues[dm.AQ18.fields[i].FieldName]:=
    dm.ADOQuery1.fieldvalues[dm.ADOQuery1.Fields[i].FieldName];
   dm.AQ18invent_ptr.AsVariant :=null; //不能复制原材料指针
   dm.aq18.post;
   dm.ADOQuery1.Next;
  end;
try
 form4 := tform4.Create(application);
 form4.v_moth:=false;
 if form4.ShowModal=mrok then
  try
   dm.AQ17.Edit;
   form3:=tform3.Create(application);
   form3.Label50.Caption := '1';   //表示新增后第一次编辑只不过是复制方法新增
   form3.ShowModal;
   bar1.SimpleText := '搜索: ';
   bar1.SimpleText := trim(bar1.SimpleText);
  finally
   form3.free;
   dm.AQ17INV_PART_NUMBER.EditMask:='';
  end
 else
  begin
   dm.AQ17.GotoBookmark(bk);
   dm.AQ17.Filter := v_filter;
   bar1.SimpleText := bar_Text+' ';
   bar1.SimpleText := trim(bar1.SimpleText);
  end;
finally
 form4.Free;
 dm.AQ17.FreeBookmark(bk);
end;

end;

procedure TForm2.N6Click(Sender: TObject);
begin
 dm.AQ17.First;
end;

procedure TForm2.N7Click(Sender: TObject);
begin
 dm.AQ17.Last;
end;

procedure TForm2.N8Click(Sender: TObject);
begin
 dm.AQ17.Prior;
end;

procedure TForm2.N9Click(Sender: TObject);
begin
 dm.AQ17.Next;
end;

procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
 if not dm.AQ17.IsEmpty then
  n2click(sender);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
 dm.AQ17.Close;
 dm.ado496.Close;
 dm.Aq0002.Close;
 dm.AQ17.Filter:=''; 
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
 if dm.AQ17.IsEmpty then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.enabled:=false;
   n5.Enabled:=false;
   n10.Enabled:=false;
   n11.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
   n3.Enabled:=true;
   n4.enabled:=true;
   n5.Enabled:=true;
   n10.Enabled:=true;
   n11.Enabled:=true;
  end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
if trim(bar1.SimpleText)='' then
 bar1.SimpleText:='搜索:';
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
 try
  form_invtype:=tform_invtype.Create(application);
  form_invtype.Edit1.Text :=trim(edit1.Text);
  if form_invtype.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
   if form_invtype.ShowModal=mrok then
    begin
     if group_ptr<>form_invtype.ADOQuery1RKEY.Value then
     begin
      edit1.Text := form_invtype.ADOQuery1GROUP_NAME.Value;
      edit1.Font.Color := clwindowtext;
      label8.Caption := form_invtype.ADOQuery1GROUP_DESC.Value;
      group_ptr:=form_invtype.ADOQuery1RKEY.Value;
      edit2.SetFocus;
      if dm.AQ17.Active then dm.AQ17.Close;
     end;
    end
   else
    edit1.SetFocus;
 finally
  form_invtype.free;
 end;
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.SelectAll;
   edit1.Font.Color :=clblue;
  end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (trim(edit1.Text)<>'') and
   (activecontrol.Name<>'BitBtn5') then
 try
  form_invtype := Tform_invtype.Create(Application);
  form_invtype.Edit1.Text:=trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_invtype.ADOQuery1.Fieldbyname('group_name').AsString))=0 then
  begin
   edit1.Font.Color:=clwindowtext;
   if group_ptr<>form_invtype.ADOQuery1RKEY.Value then
    begin
     label8.Caption:=form_invtype.ADOQuery1.FieldValues['GROUP_DESC'];
     group_ptr:=form_invtype.ADOQuery1RKEY.Value;
     if dm.AQ17.Active then dm.AQ17.Close;
    end;
  end
 else
  begin
   messagedlg('材料类别不正确,请重新输入或选择',mtinformation,[mbok],0);
   label8.Caption:='';
   edit1.SetFocus;
  end;
 finally
  form_invtype.free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (trim(edit1.Text)='') and
   (activecontrol.Name<>'BitBtn5') then
 begin
  label8.Caption := '';
  edit2.Text:='';
  dm.AQ17.Close;
 end;
end;

procedure TForm2.N10Click(Sender: TObject);
begin
form6:=tform6.Create(application);
with dm.adoquery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select USER_ID,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION, ');
  sql.Add('FROM_STRING,TO_STRING');
  sql.Add('from data0318 inner join data0073 on');
  sql.Add('data0318.user_ptr=data0073.rkey');
  sql.Add('where inventory_part_PTR='+dm.AQ17RKEY.AsString);
  open;
 end;
while not dm.adoquery1.Eof do
 begin
  form6.Memo1.Lines.Add(dm.adoquery1.fieldbyname('trans_date').AsString+
  ' 系统用户:'+dm.adoquery1.fieldbyname('user_id').AsString+' '+
  dm.adoquery1.fieldbyname('user_full_name').AsString+
  dm.adoquery1.fieldbyname('TRANS_DESCRIPTION').AsString);
  form6.Memo1.Lines.Add(' 原值: '+dm.adoquery1.fieldbyname('from_string').AsString+
  ' 变更后: '+dm.adoquery1.fieldbyname('to_string').AsString);
  dm.adoquery1.Next;
 end;
form6.ShowModal;
form6.Free;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
 bm: TBookmark;
 col, row: Integer;
 sline: String;
 mem: TStringList;
 ExcelApp: Variant;
begin
if not dm.aq17.Active then exit;
  Screen.Cursor := crHourglass;
  DBGrid1.DataSource.DataSet.DisableControls;
  bm := DBGrid1.DataSource.DataSet.GetBookmark;
  DBGrid1.DataSource.DataSet.First;

  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
  ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;
  mem := TStringList.Create;
  sline := '';

    for col := 0 to DBGrid1.FieldCount-1 do
     sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
       sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
    end;

    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;

    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TForm2.N11Click(Sender: TObject);
var
 bar_text:string;
begin
 try
  bar_text:=bar1.SimpleText;
  dm.ADO0017.Open;
  dm.AQ17.Edit;
  if dm.ado496if_flag.Value=0 then
   dm.AQ17INV_PART_NUMBER.EditMask:=dm.ado496mask_inv_number.Value;
  hide;
  form3:=tform3.Create(application);
  form3.BitBtn1.Enabled:=false;
  form3.ShowModal;
  bar1.SimpleText:=bar_text+' ';
  bar1.SimpleText:=trim(bar1.SimpleText);
 finally
  form3.free;
  dm.AQ17INV_PART_NUMBER.EditMask:='';
  dm.ADO0017.Close;
 end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 try
  form_inv := tform_inv.Create(application);
  if trim(edit1.Text)='' then
   form_inv.ADOQuery1.Open
  else
   with form_inv.ADOQuery1 do
    begin
     close;
     sql.Delete(4);
     sql.Insert(4,'where data0017.GROUP_PTR='+inttostr(self.group_ptr));
     open;
    end;

  if form_inv.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
   if form_inv.ShowModal=mrok then
    begin
     edit2.Text := form_inv.adoquery1inv_part_number.value;
     edit2.Font.Color := clwindowtext;
     with dm.AQ17 do
      begin
       close;
       sql.Delete(1);
       sql.Insert(1,'where rkey='+form_inv.ADOQuery1RKEY.AsString);
       open;
      end;
     dm.Aq0002.Open;
     dm.ado496.Open;
     if trim(edit1.Text)= '' then
      begin
       edit1.Text := form_inv.ADOQuery1GROUP_NAME.Value;
       edit1.Font.Color := clwindowtext;
       label8.Caption := form_inv.ADOQuery1GROUP_DESC.Value;
       group_ptr:=form_inv.ADOQuery1group_ptr.Value;
      end;
     dbgrid1.SetFocus;
    end
   else
    edit2.SetFocus;
 finally
  form_inv.free;
 end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button1')
  and (trim(edit2.Text)<>'') then
 try
  form_inv:=tform_inv.Create(application);
  if trim(edit1.Text)='' then
   form_inv.ADOQuery1.Open
  else
   with form_inv.ADOQuery1 do
    begin
     close;
     sql.Delete(4);
     sql.Insert(4,'where data0017.GROUP_PTR='+inttostr(self.group_ptr));
     open;
    end;
  form_inv.Edit1.Text := trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_inv.ADOQuery1INV_PART_NUMBER.Value))=0 then
  begin
   with dm.AQ17 do
    begin
     close;
     sql.Delete(1);
     sql.Insert(1,'where rkey='+form_inv.ADOQuery1RKEY.AsString);
     open;
    end;
   dm.Aq0002.Open;
   dm.ado496.Open;
   if trim(edit1.Text)= '' then
    begin
     edit1.Text := form_inv.ADOQuery1GROUP_NAME.Value;
     edit1.Font.Color := clwindowtext;
     label8.Caption := form_inv.ADOQuery1GROUP_DESC.Value;
     group_ptr:=form_inv.ADOQuery1group_ptr.Value;
    end;
   edit2.Font.Color := clwindowtext;
  end
 else
  begin
   messagedlg('原材料号码不正确,请重新输入或选择',mtinformation,[mbok],0);
   edit2.SetFocus;
  end;
 finally
  form_inv.Free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button1')
 and (trim(edit2.Text)='') then
 begin
  if trim(edit1.Text) <> '' then
   begin
    with dm.AQ17 do
     begin
      close;
      sql.Delete(1);
      sql.Insert(1,'where group_ptr='+inttostr(self.group_ptr));
      open;
     end;
    dm.Aq0002.Open;
    dm.ado496.Open;
   end;
 end;
end;

procedure TForm2.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbgrid1.SetFocus;
end;

procedure TForm2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit2.SetFocus;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssAlt in Shift) and (chr(key)='S') then showmessage(dm.AQ17.SQL.Text);
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color = clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color := clblue;
 end;
end;

end.
