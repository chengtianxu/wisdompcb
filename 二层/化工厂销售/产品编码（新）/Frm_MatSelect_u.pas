unit Frm_MatSelect_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, ComCtrls, DB,
  ADODB, ImgList, Provider;

type
  TFrm_MatSelect = class(TForm)
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    ADO17: TADOQuery;
    DataSource1: TDataSource;
    ADO17RKEY: TIntegerField;
    ADO17INV_PART_NUMBER: TStringField;
    ADO17INV_NAME: TStringField;
    ADO17INV_DESCRIPTION: TStringField;
    ADO17QUAN_ON_HAND: TBCDField;
    ADO17std_cost: TBCDField;
    ADO17unit_name: TStringField;
    ImageList1: TImageList;
    ADO17FisMAt: TIntegerField;
    Label2: TLabel;
    dsp: TDataSetProvider;
    ADO17STOP_PURCH: TStringField;
    qrytemp: TADOQuery;
    procedure FormDestroy(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    clickwhich : Integer;

  public
    field_name:string;
    FisMat:integer;
    procedure init;
  end;

var
  Frm_MatSelect: TFrm_MatSelect;
  FSTOP_PURCH,sqlstring:string;

implementation

{$R *.dfm}
 uses DM_u;


{ TFrm_MatSelect }

procedure TFrm_MatSelect.init;
var node1,node2,node3,node4:TTreeNode;
    Frkey19:^integer;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  node1:=TreeView1.Items.AddChild(nil,'所有材料');
  node2:=TreeView1.Items.AddChild(node1,'原材料');
  node2.SelectedIndex:=1;
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select * from data0019 order by 2';   //where inv_group_name<>'+quotedstr('vwj')+ '
  DM.Tmp.Open;
  while not DM.Tmp.Eof do
  begin
    new(Frkey19);
    Frkey19^:=DM.Tmp.Fields[0].AsInteger;
    node3:=TreeView1.Items.AddChildObject(node2,DM.Tmp.Fields[1].asstring+' '+DM.Tmp.Fields[2].asstring,Frkey19);
    node3.SelectedIndex:=1;
    DM.Tmp1.Close;
    DM.Tmp1.SQL.Text:='SELECT RKEY, GROUP_NAME, GROUP_DESC FROM Data0496 where GROUP_PTR='+DM.Tmp.Fields[0].AsString+' order by 2';
    DM.Tmp1.Open;
    while not DM.Tmp1.eof do
    begin
      new(Frkey19);
      Frkey19^:=DM.Tmp1.Fields[0].AsInteger;
      node4:=TreeView1.Items.AddChildObject(node3,DM.Tmp1.Fields[1].asstring+' '+DM.Tmp1.Fields[2].asstring,Frkey19);
      node4.SelectedIndex:=1;
      DM.Tmp1.Next;
    end;
    DM.Tmp.Next;
  end;
  node2:=TreeView1.Items.AddChild(node1,'半成品'); // 二级节点增加半成品

  node2.SelectedIndex:=2;

  
   //ShowMessage('窗体初始化2');
  if ADO17.Active then ADO17.Active := false;                     // ' and  GROUP_PTR not in  (select rkey from data0496 where group_ptr  in (select rkey from data0019 where inv_group_name='+#39+#39+#39+'+'+#39+'vwj'+#39+'+'+#39+#39+#39 +' ))'+

  ADO17.SQL.Text:=
  ' declare @sql nvarchar(2000)'+
  ' set @sql='+#39+'with fathers_08bom(rkey )'+
  ' as (select a.part_ptr from data0140 a join data0148 b '+
  ' on a.rkey=b.part_ptr  where b.invent_ptr ='+inttostr(DM.D08RKEY.AsInteger)+
  ' and b.invent_or=1 '+
  ' union all  select a.part_ptr from data0140 a join data0148 b '+
  ' on a.rkey=b.part_ptr and b.invent_or=1  join fathers_08bom c on b.invent_ptr=c.rkey ) '+
  ' SELECT d17.RKEY, INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION,d17.STOP_PURCH,'+
  ' (QUAN_ON_HAND-QUAN_ASSIGN) QUAN_ON_HAND,std_cost,d02.unit_name,CRITICAL_MATL_FLAG,0 FisMAt  '+
  ' FROM dbo.Data0017 d17 inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey where 0=0   '+
 ' and d17.STOP_PURCH='+#39+#39+#39+'+'+#39+'N'+#39+'+'+#39+#39+#39+  'union SELECT d08.RKEY, PROD_CODE INV_PART_NUMBER, PRODUCT_NAME INV_NAME, '+
  ' PRODUCT_DESC INV_DESCRIPTION,null as STOP_PURCH,qty_onhand  QUAN_ON_HAND,new_price std_cost,d02.unit_name,0 CRITICAL_MATL_FLAG,1 FisMAt '+
  ' from Data0008 d08 inner join data0002 d02 on d08.UNIT_PTR=d02.rkey '+
  ' where d08.TTYPE=0  and d08.rkey not in (select * from fathers_08bom ) '+#39+
  ' exec sp_executesql @sql '  ;
  //加载数据
  //如果换了产品编码，材料清单需要重新做。并且清空以前的索引
  //


  if (DM.D08RKEY.AsInteger <> DM.cdsdata17_cur08rkey1)   or (not dm.qrydata17_all.Active)
  then  //如果不是上一个产品的物料编码，就重新获取 ,没打开的话打开
  begin
   //ADO17.Open;
   if dm.qrydata17_all.Active then dm.qrydata17_all.Active := false;
   dm.qrydata17_all.SQL.Text := ADO17.SQL.Text;
   //ShowMessage('3');
   dm.qrydata17_all.Open;
   //ShowMessage('4');
   DBGridEh1.DataSource.DataSet := DM.qrydata17_all;
   DBGridEh1.DataSource.DataSet.Filter:='';

   Label2.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
   DM.cdsdata17_cur08rkey1 := DM.D08RKEY.AsInteger;
  end
  else
  begin
   DBGridEh1.DataSource.DataSet := DM.qrydata17_all;
   DBGridEh1.DataSource.DataSet.Filter:='';
   Label2.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
  end;

end;

procedure TFrm_MatSelect.FormDestroy(Sender: TObject);
var i:integer;
begin
  for i:=0 to TreeView1.Items.Count-1 do
   if TreeView1.Items[i].Data<>nil then  dispose(TreeView1.Items[i].Data) ;
end;

procedure TFrm_MatSelect.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
  Label2.Caption := '当前显示数目：' + IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
end;

procedure TFrm_MatSelect.TreeView1Click(Sender: TObject);
var s:string;
Lsql:string;
begin

  if TreeView1.Selected=nil then exit;
  FisMAt:=0;
  if ADO17.Active  then ADO17.Close;

   if TreeView1.Selected.Text='所有材料' then
   begin

     ADO17.SQL.Text:=     // ' and  GROUP_PTR not in  ( select rkey from data0496 where group_ptr  in (select rkey from data0019 where inv_group_name='+#39+#39+#39+'+'+#39+'vwj'+#39+'+'+#39+#39+#39 +' ) )'+

    ' declare @sql nvarchar(2000)'+
    ' set @sql='+#39+'with fathers_08bom(rkey )'+
    ' as (select a.part_ptr from data0140 a join data0148 b '+
    ' on a.rkey=b.part_ptr  where b.invent_ptr ='+inttostr(DM.D08RKEY.AsInteger)+
    ' and b.invent_or=1 '+
    ' union all  select a.part_ptr from data0140 a join data0148 b '+
    ' on a.rkey=b.part_ptr and b.invent_or=1  join fathers_08bom c on b.invent_ptr=c.rkey ) '+
    ' SELECT d17.RKEY, INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION,'+
    ' (QUAN_ON_HAND-QUAN_ASSIGN) QUAN_ON_HAND,std_cost,d17.STOP_PURCH,d02.unit_name,CRITICAL_MATL_FLAG,0 FisMAt  '+
    ' FROM dbo.Data0017 d17 inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey where 0=0   '+
   //过滤半成品外发
    ' and d17.STOP_PURCH='+#39+#39+#39+'+'+#39+'N'+#39+'+'+#39+#39+#39+  'union SELECT d08.RKEY, PROD_CODE INV_PART_NUMBER, PRODUCT_NAME INV_NAME, '+
    ' PRODUCT_DESC INV_DESCRIPTION,qty_onhand  QUAN_ON_HAND,new_price std_cost,null as STOP_PURCH,d02.unit_name,0 CRITICAL_MATL_FLAG,1 FisMAt '+
    ' from Data0008 d08 inner join data0002 d02 on d08.UNIT_PTR=d02.rkey '+
    ' where d08.TTYPE=0  and d08.rkey not in (select * from fathers_08bom ) '+#39+
    ' exec sp_executesql @sql ' ;
    //加载数据

   //ShowMessage(ADO17.SQL.Text); //lisa20170504

    if (DM.D08RKEY.AsInteger <> DM.cdsdata17_cur08rkey1)   or ( not dm.qrydata17_all.Active)
    then  //如果不是上一个产品的物料编码，就重新获取 ,没打开的话打开
    begin
    //ADO17.Open;
    if dm.qrydata17_all.Active then dm.qrydata17_all.Active := false;
      dm.qrydata17_all.SQL.Text := ADO17.SQL.Text;
      //ShowMessage('3');
      dm.qrydata17_all.Open;
      //ShowMessage('4');
      DBGridEh1.DataSource.DataSet := DM.qrydata17_all;
      DBGridEh1.DataSource.DataSet.Filter:='';
      Label2.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
      DM.cdsdata17_cur08rkey1 := DM.D08RKEY.AsInteger;
    end
    else
    begin
      //ShowMessage('6');
      DBGridEh1.DataSource.DataSet := DM.qrydata17_all;
      DBGridEh1.DataSource.DataSet.Filter:='';
      Label2.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
    end;
  end
else
  if TreeView1.Selected.Text='原材料' then               //  ' and  GROUP_PTR not in (select rkey from data0019 where inv_group_name='+quotedstr('vwj')+'  )'+
   begin
    ADO17.SQL.Text:='SELECT d17.RKEY, INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION,STOP_PURCH,'+
    ' (QUAN_ON_HAND-QUAN_ASSIGN) QUAN_ON_HAND,std_cost,d02.unit_name,CRITICAL_MATL_FLAG,0 as FisMAt '+
    ' FROM dbo.Data0017 d17 inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey ' +
    ' where 0=0 '+FSTOP_PURCH+

    ' order by 2';
   //加载数据
  //其实原材料可以不需要重新加载，这里为了统一，还是先写上

    if  (not dm.qrydata17_17.Active)
    then  //如果不是上一个产品的物料编码，就重新获取 ,没打开的话打开
    begin
    //ADO17.Open;
    if dm.qrydata17_17.Active then dm.qrydata17_17.Active := false;
      dm.qrydata17_17.SQL.Text := ADO17.SQL.Text;
      //ShowMessage('3');
      dm.qrydata17_17.Open;
      //ShowMessage('4');
      DBGridEh1.DataSource.DataSet := DM.qrydata17_17;
      DBGridEh1.DataSource.DataSet.Filter:='';
      Label2.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
      //DM.cdsdata17_cur08rkey := DM.D08RKEY.AsInteger;
    end
    else
    begin
      //ShowMessage('9');
      DBGridEh1.DataSource.DataSet := DM.qrydata17_17;
      DBGridEh1.DataSource.DataSet.Filter:='';
      Label2.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
    end;
   end
   else
  if TreeView1.Selected.Text='半成品' then
   begin
    FisMAt:=1;
    ADO17.SQL.Text:=
  ' declare @sql nvarchar(2000)'+
  ' set @sql='+#39+'with fathers_08bom(rkey )'+
  ' as (select a.part_ptr from data0140 a join data0148 b '+
  ' on a.rkey=b.part_ptr  where b.invent_ptr ='+inttostr(DM.D08RKEY.AsInteger)+
  ' and b.invent_or=1 '+
  ' union all  select a.part_ptr from data0140 a join data0148 b '+
  ' on a.rkey=b.part_ptr and b.invent_or=1  join fathers_08bom c on b.invent_ptr=c.rkey ) '+
  ' SELECT d08.RKEY, PROD_CODE INV_PART_NUMBER, PRODUCT_NAME INV_NAME, '+
  ' PRODUCT_DESC INV_DESCRIPTION,qty_onhand  QUAN_ON_HAND,new_price std_cost,d02.unit_name,0 CRITICAL_MATL_FLAG,1 FisMAt '+
  ' from Data0008 d08 inner join data0002 d02 on d08.UNIT_PTR=d02.rkey '+
  ' where d08.TTYPE=0  and d08.rkey not in (select * from fathers_08bom ) '+#39+
  ' exec sp_executesql @sql '  ;
         //加载数据
    if (DM.D08RKEY.AsInteger <> DM.cdsdata17_cur08rkey2)  or ( not dm.qrydata17_08.Active)
    then  //如果不是上一个产品的物料编码，就重新获取 ,没打开的话打开
    begin
    //ADO17.Open;
    if dm.qrydata17_08.Active then dm.qrydata17_08.Active := false;
      dm.qrydata17_08.SQL.Text := ADO17.SQL.Text;
      //ShowMessage('3');
      dm.qrydata17_08.Open;
      //ShowMessage('4');
      DBGridEh1.DataSource.DataSet := DM.qrydata17_08;
      DBGridEh1.DataSource.DataSet.Filter:='';
      Label2.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
      DM.cdsdata17_cur08rkey2 := DM.D08RKEY.AsInteger;
    end
    else
    begin
      //ShowMessage('7');
      //ShowMessage(IntToStr(DM.D08RKEY.AsInteger)+' d08rkey');
      //ShowMessage(IntToStr(DM.cdsdata17_cur08rkey2)+' d17curkey');
      DBGridEh1.DataSource.DataSet := DM.qrydata17_08;
      DBGridEh1.DataSource.DataSet.Filter:='';
      Label2.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
    end;
   end
  else

   if TreeView1.Selected.Level=2 then
   begin
    ADO17.SQL.Text:='SELECT d17.RKEY, d17.INV_PART_NUMBER, d17.INV_NAME, d17.INV_DESCRIPTION, (d17.QUAN_ON_HAND-d17.QUAN_ASSIGN) QUAN_ON_HAND,d17.STOP_PURCH,d17.std_cost,d02.unit_name,CRITICAL_MATL_FLAG,0 FisMAt FROM dbo.Data0017 d17 '+
                    ' inner join data0496 d496 on d17.group_ptr=d496.rkey inner join data0019 d19 on d496.group_ptr=d19.rkey inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey where d19.rkey='+inttostr(integer(TreeView1.Selected.data^))+FSTOP_PURCH+' order by 2';
    ADO17.Open;
    DBGridEh1.DataSource.DataSet := ADO17;
    Label2.Caption := IntToStr(ADO17.RecordCount);
   end
   else
    if TreeView1.Selected.Level=3 then
    begin
    ADO17.SQL.Text:='SELECT d17.RKEY, d17.INV_PART_NUMBER, d17.INV_NAME, d17.INV_DESCRIPTION, (d17.QUAN_ON_HAND-d17.QUAN_ASSIGN) QUAN_ON_HAND,d17.STOP_PURCH,d17.std_cost,d02.unit_name,CRITICAL_MATL_FLAG,0 FisMAt FROM dbo.Data0017 d17 '+
                    ' inner join data0496 d496 on d17.group_ptr=d496.rkey inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey  where d496.rkey='+inttostr(integer(TreeView1.Selected.data^))+FSTOP_PURCH+' order by 2';
    ADO17.Open;
    DBGridEh1.DataSource.DataSet := ADO17;
    Label2.Caption := IntToStr(ADO17.RecordCount);
  end ;
  edit1.Text:='';

end;                                                                                                                                        

procedure TFrm_MatSelect.DBGridEh1TitleClick(Column: TColumnEh);
begin
  clickwhich := 1;
if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end
  else
    edit1.SetFocus;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;

    if     DBGridEh1.DataSource.DataSet = ADO17    then   ADO17.Sort:=Column.FieldName;
    if     DBGridEh1.DataSource.DataSet = DM.qrydata17_all    then   DM.qrydata17_all.Sort:=Column.FieldName;
    if     DBGridEh1.DataSource.DataSet = DM.qrydata17_17    then   DM.qrydata17_17.Sort:=Column.FieldName;
    if     DBGridEh1.DataSource.DataSet = dm.qrydata17_08    then   dm.qrydata17_08.Sort:=Column.FieldName;
  end
  else
  begin
     column.Title.SortMarker:=smDownEh;
     if     DBGridEh1.DataSource.DataSet = ADO17    then ADO17.Sort:=Column.FieldName+' DESC';
     if     DBGridEh1.DataSource.DataSet = DM.qrydata17_all    then DM.qrydata17_all.Sort:=Column.FieldName+' DESC';
     if     DBGridEh1.DataSource.DataSet = DM.qrydata17_17     then DM.qrydata17_17.Sort:=Column.FieldName+' DESC';
     if     DBGridEh1.DataSource.DataSet = dm.qrydata17_08    then dm.qrydata17_08.Sort:=Column.FieldName+' DESC';
  end;


end;

procedure TFrm_MatSelect.BitBtn1Click(Sender: TObject);
begin

  if not DBGridEh1.DataSource.DataSet.IsEmpty then modalresult:=mrok;
end;

procedure TFrm_MatSelect.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
   showmessage(ADO17.SQL.Text);
end;

procedure TFrm_MatSelect.FormShow(Sender: TObject);
begin
  TreeView1Click(TreeView1.Selected) ;
end;

procedure TFrm_MatSelect.DBGridEh1CellClick(Column: TColumnEh);
begin
  clickwhich := 0;
end;

procedure TFrm_MatSelect.DBGridEh1DblClick(Sender: TObject);
begin
 if  clickwhich = 0   then BitBtn1.Click ;
end;

end.


                                                        
