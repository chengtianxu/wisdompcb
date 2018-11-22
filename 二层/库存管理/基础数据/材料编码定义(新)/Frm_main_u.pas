unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, ADODB;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BtBrush: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Grd: TDBGridEh;
    PopupMenu1: TPopupMenu;
    Add: TMenuItem;
    Edt: TMenuItem;
    Del: TMenuItem;
    Look: TMenuItem;
    BitBtn3: TBitBtn;
    N1: TMenuItem;
    Alt: TMenuItem;
    N3: TMenuItem;
    Cop: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    BitBtn6: TBitBtn;
    PopupMenu2: TPopupMenu;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure fr(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure EdtClick(Sender: TObject);
    procedure DelClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure AltClick(Sender: TObject);
    procedure LookClick(Sender: TObject);
    procedure CopClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure GrdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     PreColumn: TColumnEh;
     field_name:string;
     sSql:string;
     copy17:Integer;
 //    FOldSort:bool;
     Frkey:integer;
     procedure DoSearch(subSql:string);
     procedure item_click(sender:TObject);
    // procedure Locat(val:string);
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,damo,update_stdcost,QuerySet,Frm_New_u, Frm_detail_u,note_information,Frm_MatType_u,
   update_maxstock;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;

//  dm.ADOConnection1.Open;
//user_ptr:='4';
//vprev:='4';
//rkey73:='9';

   DateSeparator := '-';
   ShortDateFormat := 'yyyy-mm-dd';
   field_name := Grd.Columns[0].FieldName;
   PreColumn := Grd.Columns[0];
   sSql:=dm.AQ17.SQL.Text;
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
 var sSort:string;
begin
  if dm.AQ17.Active then
  begin
    Frkey:=dm.AQ17RKEY.Value;
    sSort:=dm.aq17.Sort;
    dm.AQ17.Close;
    dm.AQ17.Prepared;
    dm.AQ17.Open;
    dm.AQ17.Sort:=sSort;
    dm.AQ17.Locate('rkey',Frkey,[]);
  end
  else
   showmsg('请首先查询出材料编码明细',1);
end;

procedure TFrm_main.BitBtn3Click(Sender: TObject);
begin
  with Tform5.Create(application) do
  try
    ShowModal;
  finally
    free;
  end;
end;


procedure TFrm_main.BitBtn2Click(Sender: TObject);
begin
  if Grd.DataSource.DataSet.Active and not Grd.DataSource.DataSet.IsEmpty then
     Export_dbGridEH_to_Excel(TDBGridEh(Grd),'材料编码') ;
end;

procedure TFrm_main.DoSearch(subSql: string);
begin
  DM.AQ17.Close;
  DM.AQ17.SQL.Text := sSql+' WHERE (1=1) '+subsql;
  dm.AQ17.Prepared;
  DM.AQ17.open;
  edit1.Text:='';
  PreColumn.Title.Color := clBtnFace;
  field_name := Grd.Columns[0].FieldName;
  PreColumn := Grd.Columns[0];
  PreColumn.Title.Color := clred ;
  PreColumn.Title.SortMarker:=smUpEh;
  dm.AQ17.Sort:=PreColumn.FieldName;
end;

procedure TFrm_main.BitBtn4Click(Sender: TObject);
var
  i:integer;
  sqlstr:string;
begin
  if frmQuerySet=nil then
    frmQuerySet:=TfrmQuerySet.Create(nil);
  with frmQuerySet do
  begin
    if ShowModal = mrOk then
    begin
      for i:=1 to sgrid1.RowCount-2 do
      begin
        if sgrid1.Cells[2,i]<> '' then
          Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      end;
      DoSearch(sqlstr);
    end;
  end;
end;



procedure TFrm_main.fr(Column: TColumnEh);
begin
  if Grd.DataSource.DataSet.Active then
  begin
    if Grd.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ; //=计算字段

      Frkey:=dm.AQ17rkey.Value;
      if column.Title.SortMarker =smDownEh then
      begin
        column.Title.SortMarker:=smUpEh;
        dm.AQ17.Sort:=Column.FieldName;
      end
      else
      begin
        column.Title.SortMarker:=smDownEh;
        dm.AQ17.Sort:=Column.FieldName+' DESC';
      end;

   if Frkey<>-1 then  DM.AQ17.Locate('rkey',Frkey,[]);

//    if field_name <> column.FieldName then
//    begin
//      label1.Caption := column.Title.Caption ;
//      field_name := column.FieldName ;
//      edit1.SetFocus;
//      PreColumn.Title.Color := clBtnFace ;
//      Column.Title.Color := clred ;
//      PreColumn := column ;
//      Edit1Change(Edit1);
//    end ;
//    else
//      edit1.SetFocus;
  if (PreColumn.FieldName <> column.FieldName)
     and  (column.Field.DataType in [ftString,ftWideString]) then
   begin
    edit1.Text:='';
    edit1.SetFocus;
    label1.Caption := column.Title.Caption ;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    field_name:=Column.FieldName;
    PreColumn := column ;
   end
  else
    edit1.SetFocus;
end;


end;


procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd.DataSource.DataSet.FieldByName(field_name).FieldKind=fkCalculated then exit;
  if Grd.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
     begin
      Grd.DataSource.DataSet.Filter := '';
      if Grd.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
       begin
        if Grd.DataSource.DataSet.Filter <> '' then
          Grd.DataSource.DataSet.Filter := Grd.DataSource.DataSet.Filter + ' and ' +  field_name + ' like ''%' + trim(edit1.text) + '%'''
        else
          Grd.DataSource.DataSet.Filter := field_name+' like ''%' + trim(edit1.text) + '%''' ;
       end
      else
       if Grd.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
       begin
        if Grd.DataSource.DataSet.Filter <> '' then
          Grd.DataSource.DataSet.Filter := Grd.DataSource.DataSet.Filter + ' and ' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))
        else
          Grd.DataSource.DataSet.Filter := field_name + ' >= ' + inttostr(strtointdef(edit1.text,0)) ;
       end;
     end
    else
     Grd.DataSource.DataSet.Filter := '';
  end;
end;

procedure TFrm_main.AddClick(Sender: TObject);
var
  rkey17:integer;
  sSsort:string;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   showmessage('对不起您只有该程序的只读权限!') ;
   exit;
  end;
 if not dm.AQ17.Active then
  begin
   showmessage('请您先查询材料编码明细后再新增...');
   exit;
  end;
  Frkey:=dm.AQ17rkey.Value;
  sSsort:=dm.AQ17.Sort;
//  dm.AQ17.Filtered:=false;
//  dm.AQ17.Append;
  Frm_New := TFrm_New.Create(nil);
   try
    if Frm_New.ShowModal = mrok then
     try
      rkey17:=dm.AQ17RKEY.Value;

      dm.AQ17.Edit;

      Frm_detail:=TFrm_detail.Create(application);
      Frm_detail.FEdtState:='Add';
//2018-8-8tang
      Frm_detail.flag496:=Frm_New.if_flag;
      Frm_detail.Rkey595:=Frm_New.Rkey595;
      Frm_detail.Rkey17:=rkey17;
//end2018-8-8
//      Frm_detail.FEdtState:=TMenuitem(sender).Name;
      Frm_detail.ShowModal;

      dm.AQ17.Close;
      dm.AQ17.Open;
      dm.AQ17.Sort:=sSsort;
      dm.AQ17.Locate('rkey',rkey17,[])
     finally
      Frm_detail.free;

     end
    else
     begin
      DM.AQ17.Cancel;
      dm.AQ17.Filtered:=true;
      DM.AQ17.Locate('rkey',Frkey,[]);
     end;
   finally
     Frm_New.free;
   end;
end;

procedure TFrm_main.EdtClick(Sender: TObject);
var rkey17:integer;
      sSsort:string;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  showmessage('对不起您只有该程序的只读权限!')
 else
 try
    dm.AQ17.Edit;
    {dm.tmp.Close;
    dm.tmp.SQL.Text:='select if_flag,mask_inv_number from data0496 where rkey='+dm.AQ17group_ptr.AsString;
    dm.tmp.Open;
    if dm.tmp.FieldByName('if_flag').AsInteger=0 then  //as mask
       dm.AQ17INV_PART_NUMBER.EditMask:=trim(dm.tmp.FieldByName('mask_inv_number').AsString);
     dm.tmp.Close; }
    Frm_detail:=TFrm_detail.Create(application);
    Frm_detail.FEdtState:=TMenuitem(sender).Name;
    if (Frm_detail.FEdtState='Cop') then
    begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='select * from data0496 where Rkey='+dm.AQ17.fieldByName('GROUP_PTR').AsString;
      dm.tmp.Open;
      Frm_detail.flag496:=dm.tmp.fieldBYName('IF_FLAG').AsInteger;
      Frm_detail.Rkey595:=dm.tmp.fieldByName('Rkey595').AsString;
      Frm_detail.Rkey17:=copy17;
    end else
    begin
      Frm_detail.flag496:=dm.AQ17flag496.AsInteger;
      Frm_detail.Rkey595:=dm.AQ17Rkey595.AsString;
      Frm_detail.Rkey17:=dm.AQ17RKEY.AsInteger;
    end;
    sSsort:=dm.AQ17.Sort;
    Frm_detail.btn1.Visible := True;
    if Frm_detail.ShowModal=mrok then
    begin
      rkey17:=dm.AQ17.FieldValues['rkey'];
      dm.AQ17.Close;
      dm.AQ17.Open;
      dm.AQ17.Sort:=sSsort;
      dm.AQ17.Locate('rkey',rkey17,[]);
    end;
 finally
    Frm_detail.free;
    //dm.AQ17INV_PART_NUMBER.EditMask:='';
 end;
end;

procedure TFrm_main.DelClick(Sender: TObject);
var sSsort:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  end
  else
   if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
   try
     dm.ADOConnection1.BeginTrans;
     dm.tmp.Close;
     dm.tmp.SQL.Text:='delete from data0011 where  source_type=17 and file_pointer='+dm.AQ17RKEY.AsString; //记事本
     dm.tmp.ExecSQL;

     dm.tmp.SQL.Text:='delete from data0018 where invent_ptr='+dm.AQ17RKEY.AsString;  //仓库
     dm.tmp.ExecSQL;

     dm.tmp.SQL.Text:='delete from data0017 where rkey='+dm.AQ17RKEY.AsString;
     dm.tmp.ExecSQL;                           //若此材料已使用，则不能删除(数据库中建外键约束)
     dm.ADOConnection1.CommitTrans;
     messagedlg('删除操作成功',mtinformation,[mbok],0);
     sSsort:=dm.AQ17.Sort;
     dm.AQ17.close;
     dm.AQ17.Open;
     dm.AQ17.Sort:=sSsort;
   except
     dm.ADOConnection1.RollbackTrans;
     showmessage('此材料编码已使用,不能删除,操作失败...');
   end;

end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
   Edt.Enabled:=not dm.AQ17.IsEmpty;
   Del.Enabled:=Edt.Enabled;
   Look.Enabled:=Edt.Enabled;
   alt.Enabled:=Edt.Enabled;
   cop.Enabled:=Edt.Enabled;
   N4.Enabled:=Edt.Enabled and (vprev='4');
end;

procedure TFrm_main.AltClick(Sender: TObject);
begin
 form6:=tform6.Create(application);
 with dm.tmp do
 begin
   close;
   sql.Clear;
   sql.Add('select user_login_name,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION, ');
   sql.Add('FROM_STRING,TO_STRING');
   sql.Add('from data0318 inner join data0073 on');
   sql.Add('data0318.user_ptr=data0073.rkey');
   sql.Add('where inventory_part_PTR='+dm.AQ17RKEY.AsString);
   open;
 end;
 while not dm.tmp.Eof do
 begin
   form6.Memo1.Lines.Add(dm.tmp.fieldbyname('trans_date').AsString+
                      ' 系统用户:'+dm.tmp.fieldbyname('user_login_name').AsString+' '+
                       dm.tmp.fieldbyname('user_full_name').AsString+
                      dm.tmp.fieldbyname('TRANS_DESCRIPTION').AsString);
                      form6.Memo1.Lines.Add(' 原值: '+dm.tmp.fieldbyname('from_string').AsString+
                      ' 变更后: '+dm.tmp.fieldbyname('to_string').AsString);
   dm.tmp.Next;
 end;
 form6.ShowModal;
 form6.Free;
end;

procedure TFrm_main.LookClick(Sender: TObject);
begin
  with TFrm_detail.Create(nil) do
  begin
    FEdtState:='Look';
    flag496:=dm.AQ17flag496.AsInteger;
    Rkey595:=dm.AQ17Rkey595.AsString;
    Rkey17:=dm.AQ17RKEY.AsInteger;
    ShowModal;
    free;
  end;
end;

procedure TFrm_main.CopClick(Sender: TObject);
var
     v_recode:array[1..81] of variant;
     i:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;
  copy17:=dm.AQ17.fieldByName('RKEY').AsInteger;
  for i:=1 to 81 do v_recode[i]:=dm.AQ17.Fields[i].Value;

//  with dm.tmp do
//  begin
//    close;
//    sql.Clear;
//    sql.Add('select whouse_ptr,min_stock,max_stock,reorder_point,');
//    sql.Add('location_ptr1,location_ptr2,location_ptr3,location_ptr4,location_ptr5');
//    sql.Add('from data0018');
//    sql.Add('where invent_ptr='+dm.AQ17RKEY.AsString);
//    open;
//  end;

 Edit1.Text:='';      //为了规避filter带来的append定位不到新记录行的问题而修改
 dm.AQ17.Filtered:=False;
 dm.AQ17.Filtered:=True;
 dm.AQ17.Append;
 for i:=1 to 81 do dm.AQ17.fieldvalues[dm.AQ17.Fields[i].FieldName]:=v_recode[i];

// dm.AQ18.Close;
// dm.AQ18.Parameters[0].Value :=null;
// dm.AQ18.Open;

// while not dm.tmp.Eof do
// begin
//   dm.AQ18.Append;
//   for i:=0 to dm.tmp.FieldCount-1 do
//     dm.AQ18.FieldValues[dm.tmp.Fields[i].FullName]:=dm.tmp.fieldvalues[dm.tmp.Fields[i].FullName];
//   dm.aq18.post;
//   dm.tmp.Next;
// end;
 EdtClick(Sender);
end;



procedure TFrm_main.N4Click(Sender: TObject);
begin
  if (dm.AQ17flag496.AsInteger=3) then
  begin
    ShowMessage('规则输入不可修改类型！');
    Exit;
  end;
   Frm_MatType:=TFrm_MatType.Create(nil);
   try
     DM.tmp.Close;
     DM.tmp.SQL.Text:='select mask_inv_number,if_flag from data0496 where rkey='+DM.AQ17group_ptr.AsString;
     DM.tmp.Open;
     if DM.tmp.Fields[1].AsInteger=0 then    //作为mask
       Frm_MatType.MaskEdit1.EditMask:=DM.tmp.Fields[0].AsString;
     DM.tmp.Close;
     Frm_MatType.MaskEdit1.Text:=DM.AQ17INV_PART_NUMBER.Value;
     Frm_MatType.Edit1.Text:=DM.AQ17INV_NAME.Value;
     Frm_MatType.Edit2.Text:=DM.AQ17INV_DESCRIPTION.Value;
     Frm_MatType.Edit3.Text:=DM.AQ17group_name.Value;
     Frm_MatType.Edit3.tag:=DM.AQ17group_ptr.Value;
     Frm_MatType.Label5.Caption:=DM.AQ17group_desc.Value;
     if Frm_MatType.ShowModal=mrok then
     begin
       DM.tmp.SQL.Text:='';
       if Frm_MatType.Edit3.tag<>DM.AQ17group_ptr.Value then   //改了类别
         DM.tmp.SQL.Text:='update data0017 set INV_PART_NUMBER='''+Frm_MatType.MaskEdit1.Text+''','+
                          'group_ptr='+inttostr(Frm_MatType.Edit3.tag)+','+
                          'IES_PARAMETER_VALUE1=null,IES_PARAMETER_VALUE2=null,IES_PARAMETER_VALUE3=null,'+
                          'IES_PARAMETER_VALUE4=null,IES_PARAMETER_VALUE5=null,IES_PARAMETER_VALUE6=null,'+
                          'IES_PARAMETER_VALUE7=null,IES_PARAMETER_VALUE8=null,IES_PARAMETER_VALUE9=null,'+
                          'IES_PARAMETER_VALUE10=null '+
                          'where rkey='+DM.AQ17rkey.AsString+' and INV_PART_NUMBER='''+DM.AQ17INV_PART_NUMBER.Value+''''
       else
       if trim(Frm_MatType.MaskEdit1.Text)<>trim(DM.AQ17INV_PART_NUMBER.Value) then //只改编码
         DM.tmp.SQL.Text:='update data0017 set INV_PART_NUMBER='''+Frm_MatType.MaskEdit1.Text+''''+
                          ' where rkey='+DM.AQ17rkey.AsString+' and INV_PART_NUMBER='''+DM.AQ17INV_PART_NUMBER.Value+'''' ;
     if DM.tmp.SQL.Text<>'' then
     begin
       if DM.tmp.ExecSQL<>1 then
         showmessage('数据状态发生变化,保存失败...')
       else
       begin
        dm.tmp.close;
        dm.tmp.sql.Text:='insert into data0318 (INVENTORY_PART_PTR,TRANS_TYPE,TRANS_DESCRIPTION,'+
                         'FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE) '+
                         'values ('+dm.AQ17RKEY.AsString+',7,''更改材料类别/编码'','+
                         ''''+DM.AQ17INV_PART_NUMBER.Value+''','''+Frm_MatType.MaskEdit1.Text+''','+rkey73+','+
                         'getdate(),89)';
        dm.tmp.ExecSQL;
        if Frm_MatType.Edit3.tag<>DM.AQ17group_ptr.Value then
          showmessage('修改类别/编码成功,请再编辑此物料的类别参数!')
        else
          showmessage('修改物料编码成功!');
       end;
       BtBrushClick(nil);
     end;
     end;
   finally
     Frm_MatType.Free;
   end;
   
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to grd.FieldCount-1 do
  if grd.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    grd.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to grd.FieldCount-1 do
  if grd.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    grd.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TFrm_main.FormActivate(Sender: TObject);
var
 i:integer;
 item:TMenuItem;
begin
 for i:=1 to grd.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := grd.Columns[i-1].Title.Caption ;
    if grd.Columns[i-1].Visible then
      item.Checked := true ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
  end;
end;

procedure TFrm_main.BitBtn5Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;
  frm_updatemaxstock:= Tfrm_updatemaxstock.Create(application);
  try
    if frm_updatemaxstock.ShowModal=mrok then
    begin

    end;
  finally
    frm_updatemaxstock.free;
  end;
end;

procedure TFrm_main.GrdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.AQ17.SQL.Text);
end;

procedure TFrm_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmQuerySet.Free;
end;

end.
