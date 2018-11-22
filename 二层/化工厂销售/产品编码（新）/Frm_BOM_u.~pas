unit Frm_BOM_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,DB, Grids, DBGridEh, Menus, StdCtrls, Buttons, OleServer, Excel2000, ComObj,
  ComCtrls, DBGrids, ADODB, DBClient;

type
  TFrm_BOM = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    N9: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    edt_1: TEdit;
    Label5: TLabel;
    Panel2: TPanel;
    TabSheet3: TTabSheet;
    DBGridEh3: TDBGridEh;
    Label6: TLabel;
    ADO70: TADOQuery;
    ADO70cust_code: TStringField;
    ADO70ABBR_NAME: TStringField;
    ADO70sales_order: TStringField;
    ADO70sales_date: TDateTimeField;
    ADO70unit_name: TStringField;
    ADO70complete_date: TDateTimeField;
    ADO70CONTACT_NAME: TStringField;
    ADO70CONT_PHONE: TStringField;
    ADO70remark: TStringField;
    ADO70status_c: TStringField;
    ADO70status: TWordField;
    ADO70prod_ptr: TIntegerField;
    ADO70PROD_CODE: TStringField;
    ADO70PRODUCT_NAME: TStringField;
    ADO70DEPT_CODE: TStringField;
    ADO70DEPT_NAME: TStringField;
    ADO70PRODUCT_DESC: TStringField;
    ADO70quantity: TFloatField;
    ds70: TDataSource;
    TabSheet4: TTabSheet;
    DBGridEh4: TDBGridEh;
    DBGridEh5: TDBGridEh;
    Edit3: TEdit;
    Label7: TLabel;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    DBGridEh2: TDBGridEh;
    Edit2: TEdit;
    Label2: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label8: TLabel;
    Edit4: TEdit;
    Panel6: TPanel;
    dgh_grd1: TDBGridEh;
    LBOMName: TLabel;
    BitBtn5: TBitBtn;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Button1: TButton;
    PopupMenu3: TPopupMenu;
    N_UpdateBOM: TMenuItem;
    ADODataSet2: TADODataSet;
    lbl2: TLabel;
    Label9: TLabel;
    PopupMenu4: TPopupMenu;
    N_select: TMenuItem;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PageControl1Change(Sender: TObject);
    procedure edt_1Change(Sender: TObject);
    procedure dgh_grd1TitleClick(Column: TColumnEh);
    procedure DBGridEh3TitleClick(Column: TColumnEh);
    procedure DBGridEh4TitleClick(Column: TColumnEh);
    procedure DBGridEh5TitleClick(Column: TColumnEh);
    procedure Edit3Change(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgh_grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N_UpdateBOMClick(Sender: TObject);
    procedure N_selectClick(Sender: TObject);
    procedure DBGridEh2CellClick(Column: TColumnEh);
    procedure DBGridEh2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);


  private
    PreColumn1,PreColumn2: TColumnEh;
    field_name1,field_name2:string;
    PreColumn: TColumnEh;
    field_name: string;
    TimerTag: Integer;
  public
    procedure init;
  end;

var
  Frm_BOM: TFrm_BOM;

implementation
  uses DM_u,common,Frm_BOMEdt_u, MatPriceEdt, SendMessage, Form_SEE_u;
{$R *.dfm}

procedure TFrm_BOM.PopupMenu1Popup(Sender: TObject);
begin
  //140表 0未审核；1工程审核；2物控审核
//  if StrToInt(vprev) >= 2 then
   N1.Enabled := StrToInt(vprev) in[2,3,4];                                //新增
  N2.Enabled:=not DM.ADO140.IsEmpty and N1.Enabled and (DM.ADO140status.Value=0); //修改
  N3.Enabled:=N2.Enabled;                                                         //删除
  N5.Enabled:=not DM.ADO140.IsEmpty and (StrToInt(vprev) in [3,4]) and (DM.ADO140status.Value=0); //工程审核
  N6.Enabled:=not DM.ADO140.IsEmpty and (StrToInt(vprev) in [3,4]) and (DM.ADO140status.Value=1) and (DM.ADO140user2_ptr.IsNull); //工程反审
  N9.Enabled:=not DM.ADO140.IsEmpty and (StrToInt(vprev)=4) and (DM.ADO140status.Value=1); //重算成本
  N11.Enabled:=not DM.ADO140.IsEmpty and (StrToInt(vprev)=4) and (DM.ADO140status.Value=1) and (DM.ADO140user2_ptr.IsNull); //物控审核
  N12.Enabled:=not DM.ADO140.IsEmpty and (StrToInt(vprev)=4) and (DM.ADO140status.Value=1) and (DM.ADO140user2_ptr.Value > 0); //物控反审
  N8.Enabled:=N2.Enabled ;//作废

  {N1.Enabled:=(vprev='2') or (vprev='4');
  N2.Enabled:=not DM.ADO140.IsEmpty and N1.Enabled and (DM.ADO140status.Value=0);
  N3.Enabled:=N2.Enabled;

  N5.Enabled:=not DM.ADO140.IsEmpty and (vprev='4') and (DM.ADO140status.Value=0);
  N6.Enabled:=not DM.ADO140.IsEmpty and (vprev='4') and (DM.ADO140status.Value=1);
  N9.Enabled:=not DM.ADO140.IsEmpty and (vprev='4') and (DM.ADO140status.Value=1);
  N8.Enabled:=N2.Enabled ; }
end;

procedure TFrm_BOM.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.Filtered = False then DBGridEh1.DataSource.DataSet.Filtered := True;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name1).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name1).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name1 + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name1).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name1+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_BOM.Edit2Change(Sender: TObject);
begin
  if DBGridEh2.DataSource.DataSet.Filtered = False then DBGridEh2.DataSource.DataSet.Filtered := True;
  if DBGridEh2.DataSource.DataSet.FieldByName(field_name2).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit2.text) <> '' then
    begin
      if DBGridEh2.DataSource.DataSet.FieldByName(field_name2).DataType in  [ftString, ftWideString]  then
        DBGridEh2.DataSource.DataSet.Filter:=' (' +  field_name2 + ' like ''%' + trim(edit2.text) + '%'')'
      else if DBGridEh2.DataSource.DataSet.FieldByName(field_name2).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh2.DataSource.DataSet.Filter:=' (' + field_name2+' >= ' + inttostr(strtointdef(edit2.text,0))+')';
    end else
      DBGridEh2.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_BOM.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.IsEmpty then exit;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO140.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO140.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name1 <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name1 := column.FieldName ;
    edit1.SetFocus;
    PreColumn1.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn1 := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_BOM.DBGridEh2TitleClick(Column: TColumnEh);
begin
if DBGridEh2.DataSource.DataSet.IsEmpty then exit;

  if DBGridEh2.DataSource = dm.ds148  then
  begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO148.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO148.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh2.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name2 <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name2 := column.FieldName ;
    edit2.SetFocus;
    PreColumn2.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
    Edit2Change(Edit1);
  end else
    edit2.SetFocus;
  end;

    if DBGridEh2.DataSource = dm.ds148s  then
  begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO148s.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO148s.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh2.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name2 <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name2 := column.FieldName ;
    edit2.SetFocus;
    PreColumn2.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
    Edit2Change(Edit1);
  end else
    edit2.SetFocus;
  end;


end;

procedure TFrm_BOM.init;
begin
  field_name1 := DBGridEh1.Columns[0].FieldName;
  PreColumn1 := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;

  field_name2 := DBGridEh2.Columns[0].FieldName;
  PreColumn2 := DBGridEh2.Columns[0];
  DBGridEh2.Columns[0].Title.Color := clred ;
  
  DM.ADO140.Close;
  DM.ADO140.Parameters[0].Value:=DM.D08RKEY.Value;
  DM.ADO140.Open;
end;

procedure TFrm_BOM.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_BOM.BitBtn3Click(Sender: TObject);
var
 rkey140: integer;
begin
  rkey140:=0;
  if not dm.ADO140.IsEmpty then  rkey140:=dm.ADO140rkey.Value;
  dm.ADO140.Close;
  dm.ADO140.Open;
  dm.ADO140.Locate('rkey',rkey140,[]);
  dm.ADO148.Close;
  DM.ADO148.Parameters[0].Value := rkey140;
  DM.ADO148.Parameters[1].Value := rkey140;
  dm.ADO148.Open;
end;

procedure TFrm_BOM.N1Click(Sender: TObject);
begin
  //权限不为4的无法操作别人的记录
  if (user_ptr <> DM.ADO140user_ptr.AsString) and (Tmenuitem(Sender).Tag <> 0) and (not DM.ADO140user_ptr.IsNull) and (strtoint(vprev) < 3)
  then
  begin
   ShowMessage('对不起，您无权操作别人的记录！');
   Exit;
  end;
  if not (DM.ADO140.IsEmpty) then
  with DM.Tmp do
  begin
    Close;
    SQL.Text :=' SELECT  data0148.seq_no,data0148.rkey,data0148.PART_PTR,data0148.INVENT_PTR,data0148.repl_invt_ptr,'
      + #13#10 +
      'data0148.QUAN_BOM,data0148.VENDOR,data0148.Invent_or,data0148.STD_COST ,' 
      + #13#10 + 
      'case when data0148.invent_or=0 then ''材料'' else ''半成品'' end invent_tp,' 
      + #13#10 + 
      'd17_0.inv_part_number,d17_0.inv_name,d17_0.INV_DESCRIPTION,' 
      + #13#10 + 'data0148.QUAN_BOM*data0148.STD_COST TotalCost,' 
      + #13#10 + 
      'case when d17_0.STOP_PURCH=''Y'' then ''是''   when d17_0.STOP_PURCH=''N'' then ''否''  else '''' end as STOP_PURCH,'
      + #13#10 + 
      'case when d17_1.STOP_PURCH=''Y'' then ''是''   when d17_1.STOP_PURCH=''N'' then ''否''  else '''' end as STOP_PURCH1,' 
      + #13#10 + 
      'd17_1.inv_part_number inv_part_number_r ,d17_1.inv_name inv_name_r,d17_1.INV_DESCRIPTION INV_DESCRIPTION_r,' 
      + #13#10 + 
      'd02.unit_name,d17_0.QUAN_ON_HAND,d17_0.CRITICAL_MATL_FLAG,0.0 as  QUAN_ISSUED,p_code,production_teamname'
      + #13#10 +
      'FROM         dbo.DATA0148 inner join data0017 d17_0 on data0148.invent_ptr=d17_0.rkey ' 
      + #13#10 + 
      '               inner join data0002 d02 on d17_0.STOCK_UNIT_PTR=d02.rkey'
      + #13#10 + 
      '               left join data0017 d17_1 on data0148.repl_invt_ptr=d17_1.rkey' 
      + #13#10 + 'where data0148.invent_or=0 ' + #13#10 +
      'and data0148.part_ptr='+dm.ADO140rkey.AsString + ' and d17_0.STOP_PURCH=''Y''';

    Open;
  end;

  if not (Dm.Tmp.IsEmpty) and (Tmenuitem(Sender).Tag in [3]) then
  begin
//    ShowMessage('有已停止采购物料，不能审核，请删除后再试');
    if MessageBox(Handle,'有已停止采购物料,是否需要继续','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;

  end;

  case Tmenuitem(Sender).Tag of
     0,1:  //add,edit
     try
       Frm_BOMEdt:=TFrm_BOMEdt.Create(nil);
       Frm_BOMEdt.Ftag:=Tmenuitem(Sender).Tag;
       Frm_BOMEdt.init;
       if Frm_BOMEdt.ShowModal=mrok then
       begin
         Edit1.Text:='';
         Edit2.Text:='';
         dm.ADO140.Close;
         dm.ADO140.Filter:='';
         dm.ADO140.Open;
         dm.ADO140.Locate('rkey',Frm_BOMEdt.Frkey140,[]);
       end;
     finally
       Frm_BOMEdt.Free;
     end;
    2: begin  //delete
         if MessageBox(Handle,'确定删除此BOM吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          DM.Tmp.Close;
          {DM.Tmp.SQL.Text:=' SELECT top 1 dbo.Data0468.INVENT_PTR, dbo.Data0468.QUAN_ISSUED '+
                           ' FROM dbo.data0492 INNER JOIN '+
                           ' dbo.DATA0268 ON dbo.data0492.CUT_NO = dbo.DATA0268.CUT_NO INNER JOIN '+
                           ' dbo.Data0468 ON dbo.DATA0268.rkey = dbo.Data0468.FLOW_NO ' +
                           ' inner join data0148 on data0148.invent_ptr=data0468.invent_ptr ' +
                           ' and data0468.invent_or=0 and data0148.PART_PTR='+DM.ADO140rkey.AsString+
                           ' where dbo.data0492.BOM_PTR='+DM.D08RKEY.AsString;}
          DM.Tmp.SQL.Text := 'select dbo.Data0468.INVENT_PTR, dbo.Data0468.QUAN_ISSUED from data0468 '
                             + ' inner join data0148 on data0468.bom_list_ptr=data0148.rkey '
                             + ' inner join data0140 on data0148.PART_PTR=data0140.rkey '
                             + ' where data0140.rkey= ' + DM.ADO140rkey.AsString;
          DM.Tmp.Open;
         if (not DM.Tmp.IsEmpty)  and (DM.Tmp.FieldByName('QUAN_ISSUED').AsInteger > 0) then
           showmessage('此BOM已生成领料单,不能删除...')
         else
         begin
           DM.Tmp.Close;
           DM.Tmp.SQL.Text:='delete from data0140 where rkey='+DM.ADO140RKEY.AsString;
           DM.Tmp.ExecSQL;
           DM.ADO140.Prior;
           BitBtn3Click(nil);
         end;
       end;
    3: begin   //工程审核
         if strtoint(vprev) < 3 then
         begin
           messagedlg('对不起!您没有该程序的审核权限',mtinformation,[mbok],0);
           Exit;
         end;
         DM.Tmp.Close;
         DM.Tmp.SQL.Text:='select getdate()';
         DM.Tmp.Open;
         try
           DM.ADOCon.BeginTrans;
           DM.ADO140.Edit;
           DM.ADO140status.Value:=1;
           DM.ADO140user_ptr.Value:=strtoint(user_ptr);
           DM.ADO140auth_date.Value:=DM.Tmp.Fields[0].AsDateTime;
           DM.ADO140.Post;
          // showmessage('审核标识修改成功');
         {DM.tmp.Close;
          DM.tmp.SQL.Text:= 'if exists(select * from tempdb..sysobjects where id=object_id('+quotedstr('tempdb..#TEMP1')+'))'+
            ' drop table #TEMP1   '+
            ' select  data0140.part_ptr,round(SUM( dbo.DATA0148.STD_COST * dbo.DATA0148.QUAN_BOM ),2) as total '+
            ' into #temp1   '+
            ' FROM dbo.DATA0140 INNER JOIN dbo.DATA0148  ON dbo.DATA0140.rkey = dbo.DATA0148.PART_PTR'+
            ' WHERE (dbo.DATA0140.part_ptr = '+dm.D08RKEY.AsString+') and  (dbo.DATA0140.status = 1)'+
            ' group by data0140.part_ptr  '+
            ' update data0008 '+
            ' set total_cost=b.total '+
            ' from data0008 a join #temp1 b on a.rkey=b.part_ptr '+
            ' where a.rkey='+dm.D08RKEY.AsString;

          showmessage(DM.tmp.SQL.Text);
          DM.tmp.ExecSQL; }
            dm.cmd1.CommandText := ' update data0008  '+
            ' set total_cost=derivedtbl_1.t_cost    ' +
            ' FROM         dbo.Data0008 INNER JOIN   ' +
            ' (SELECT     dbo.DATA0140.part_ptr,     '  +
            ' ROUND(SUM(dbo.DATA0148.STD_COST * dbo.DATA0148.QUAN_BOM), 2) AS t_cost '+
            ' FROM          dbo.DATA0140 INNER JOIN   '+
            ' dbo.DATA0148 ON dbo.DATA0140.rkey = dbo.DATA0148.PART_PTR INNER JOIN  '+
            ' dbo.Data0008 AS Data0008_1 ON dbo.DATA0140.part_ptr = Data0008_1.RKEY '+
            ' WHERE      (dbo.DATA0140.part_ptr = '+DM.D08RKEY.AsString+') AND (dbo.DATA0140.status = 1) '+
            ' GROUP BY dbo.DATA0140.part_ptr) AS derivedtbl_1 ON dbo.Data0008.RKEY = derivedtbl_1.part_ptr '+
            ' where data0008.rkey='+DM.D08RKEY.AsString ;
            //showmessage(dm.cmd1.CommandText);
            dm.cmd1.Execute;
           // showmessage('总价更新成功');
            DM.ADOCon.CommitTrans;
         except
            on E: Exception do
            begin
              DM.ADOCon.RollbackTrans;
              showmessage('数据保存发生错误:'+E.Message);
            end;
          end;
         BitBtn3Click(nil);
       end;
    4: begin
         if strtoint(vprev) < 3 then
         begin
           messagedlg('对不起!您没有该程序的反审权限',mtinformation,[mbok],0);
           Exit;
         end;
         with DM.Tmp do
         begin
           Close;
           SQL.Clear;
           SQL.Text := 'select status from data0140 where rkey='+DM.ADO140RKEY.AsString;
           Open;
           if FieldByName('status').Value = 3 then
           begin
             ShowMessage('物控已审，无法反审核，请通知物控人员进行反审核！');
             Exit;
           end;
         end;
         DM.Tmp.Close;
         DM.Tmp.SQL.Text:='update data0140 set status=0,user_ptr=null,auth_date=null where status=1 and  rkey='+DM.ADO140rkey.AsString;
         if DM.Tmp.ExecSQL<>1 then
           showmessage('数据状态发生变化,反审核失败')
         else begin
           DM.Tmp.Close;
           DM.Tmp.SQL.Text:='update data0008 set total_cost=(SELECT top 1 isnull(SUM(dbo.DATA0148.STD_COST * dbo.DATA0148.QUAN_BOM),0) '+
                            'FROM dbo.DATA0140 INNER JOIN dbo.DATA0148 ON dbo.DATA0140.rkey = dbo.DATA0148.PART_PTR '+
                            'WHERE (dbo.DATA0140.part_ptr ='+DM.D08RKEY.AsString+' ) AND (dbo.DATA0140.status = 1)) '+
                            'where rkey='+DM.D08RKEY.AsString;
//           ShowMessage(DM.Tmp.SQL.Text);
           DM.Tmp.ExecSQL;
         end;
         BitBtn3Click(nil);
       end;
    5: begin     //作废
         DM.ADO140.Edit;
         DM.ADO140status.Value:=2;
         DM.ADO140.Post;
         BitBtn3Click(nil);
       end;
    6:
     begin     //重新算标准成本
       try
           if (strtoint(vprev)<>4) then
           begin
             messagedlg('对不起!您没有该程序的重算成本权限',mtinformation,[mbok],0);
             Exit;
           end;
          //成品部分
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:=' update data0148  '+
            ' set std_cost=b.std_cost ' +
            ' from data0148 a  ' +
            ' join data0017 b '  +
            ' on a.invent_ptr=b.rkey '+
            ' where  part_ptr in(   '  +
            ' select rkey from data0140 '+
            ' where part_ptr='+DM.D08RKEY.AsString+
            ') and a.invent_or=0 ';
          DM.Tmp.ExecSQL;
          DM.Tmp.Close;
          //半成品部分
          DM.Tmp.SQL.Text:=' update data0148  '+
            ' set std_cost=b.total_cost ' +
            ' from data0148 a  ' +
            ' join data0008 b '  +
            ' on a.invent_ptr=b.rkey '+
            ' where  part_ptr in(   '  +
            ' select rkey from data0140 '+
            ' where part_ptr='+DM.D08RKEY.AsString+
            ') and a.invent_or=1 ';
          DM.Tmp.ExecSQL;
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:='update data0008 set total_cost=(SELECT SUM(dbo.DATA0148.STD_COST * dbo.DATA0148.QUAN_BOM) '+
                                      'FROM dbo.DATA0140 INNER JOIN dbo.DATA0148 ON dbo.DATA0140.rkey = dbo.DATA0148.PART_PTR '+
                                      'WHERE (dbo.DATA0140.part_ptr ='+DM.D08RKEY.AsString+' ) AND (dbo.DATA0140.status = 1)) '+
                                      'where rkey='+DM.D08RKEY.AsString;
           DM.Tmp.ExecSQL;

       except
        on E: Exception do
        begin
          showmessage('数据更新发生错误:'+E.Message);
        end;
       end;
     end;
  end;
end;

procedure TFrm_BOM.BitBtn2Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin

    if not DM.ADO148.IsEmpty then
    begin
      Export_dbGridEH_to_Excel(DBGridEh2, DM.ADO140part_name.AsString);
    end;
  end;

  if PageControl1.ActivePageIndex = 1 then
    if not DM.aqCP148.IsEmpty then
      Export_dbGridEH_to_Excel(DBGridEh5, DM.aqCP140part_name.AsString);

  if PageControl1.ActivePageIndex = 2 then
    if not DM.cds_wzcp0492.IsEmpty then  // DM.ADO140part_name.AsString + '; ' +
      Export_dbGridEH_to_Excel(dgh_grd1,  DM.ADo492Cut_no.AsString);
    
  if PageControl1.ActivePageIndex = 3 then
    if not DM.aqCP148.IsEmpty then
      Export_dbGridEH_to_Excel(DBGridEh3, DM.ADO140part_name.AsString);
end;

procedure TFrm_BOM.BitBtn4Click(Sender: TObject);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
  b:boolean;
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    if DM.ADO140.IsEmpty then exit;
    DM.ADO140.DisableControls;
    DM.ADO148.DisableControls;
    DM.ADO140.First;
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
    XLApp.WorkBooks.Add;
    while not DM.ADO140.Eof do
    begin
      if DM.ADO140status.AsInteger<>1 then
      begin
        DM.ADO140.Next;
        continue;
      end;
      if  b then
        Sheet :=XLApp.Sheets.Add
      else begin
        b:=true;
        Sheet :=XLApp.WorkBooks[1].WorkSheets[1];
      end;
      Sheet.name:=DM.ADO140part_name.AsString;
      DM.ADO148.first;
      v_cloumn := 0;
      for iCount := 0 to DBGridEh2.Columns.Count - 1 do
        if DBGridEh2.Columns.Items[iCount].Visible then
          Sheet.Cells[1, iCount + 1 - v_cloumn] :=DBGridEh2.Columns[iCount].Title.Caption
        else
          inc(v_cloumn);

      jCount := 1;
      while not DM.ADO148.Eof do
      begin
        v_cloumn := 0;
        for iCount := 0 to DBGridEh2.Columns.Count - 1 do
          if DBGridEh2.Columns[iCount].Visible = true then
          begin
            if DBGridEh2.Columns[iCount].Field.DataType=ftString then
              Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';
            Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] := DBGridEh2.Columns[iCount].Field.AsString;
          end else
            inc(v_cloumn);
        Inc(jCount);
        DM.ADO148.Next;
      end;
      DM.ADO140.Next;
    end;

    XlApp.Visible := True;
    Screen.Cursor := crDefault;
    DM.ADO140.EnableControls;
    DM.ADO148.EnableControls;
  end;
  if PageControl1.ActivePageIndex = 1 then
  begin
    if DM.aqCP140.IsEmpty then exit;
    DM.aqCP140.DisableControls;
    DM.aqCP148.DisableControls;
    DM.aqCP140.First;
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
    XLApp.WorkBooks.Add;
    while not DM.aqCP140.Eof do
    begin
      if DM.aqCP140status.AsInteger<>1 then
      begin
        DM.aqCP140.Next;
        continue;
      end;
      if b then
        Sheet:= XLApp.Sheets.Add
      else begin
        b:= true;
        Sheet:= XLApp.WorkBooks[1].WorkSheets[1];
      end;
      Sheet.name:=DM.aqCP140part_name.AsString;
      DM.aqCP148.first;
      v_cloumn := 0;
      for iCount := 0 to DBGridEh2.Columns.Count - 1 do
        if DBGridEh2.Columns.Items[iCount].Visible then
          Sheet.Cells[1, iCount + 1 - v_cloumn] :=DBGridEh2.Columns[iCount].Title.Caption
        else
          inc(v_cloumn);

      jCount := 1;
      while not DM.aqCP148.Eof do
      begin
        v_cloumn := 0;
        for iCount := 0 to DBGridEh2.Columns.Count - 1 do
          if DBGridEh2.Columns[iCount].Visible = true then
          begin
            if DBGridEh2.Columns[iCount].Field.DataType=ftString then
              Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';
            Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] := DBGridEh2.Columns[iCount].Field.AsString;
          end else
            inc(v_cloumn);
        Inc(jCount);
        DM.aqCP148.Next;
      end;
      DM.aqCP140.Next;
    end;

    XlApp.Visible := True;
    Screen.Cursor := crDefault;
    DM.aqCP140.EnableControls;
    DM.aqCP148.EnableControls;
  end;
end;

procedure TFrm_BOM.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DM.ADO148.FieldByName('CRITICAL_MATL_FLAG').Value=1 then
  begin
    DBGridEh2.Canvas.Font.Color := Clred;
    DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if DM.ADO148.FieldByName('STOP_PURCH').Value='是' then
  begin
    DBGridEh2.Canvas.Font.Color := clBlue;
    DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrm_BOM.PageControl1Change(Sender: TObject);
var
  Rkey08: string;
begin
  if PageControl1.ActivePageIndex = 1 then
  begin
    DM.aqCP140.Close;
    DM.aqCP140.Parameters[0].Value:= DM.D08RKEY.Value;
    DM.aqCP140.Open;
    field_name1:= DBGridEh4.Columns[0].FieldName;
    PreColumn1:= DBGridEh4.Columns[0];
    DBGridEh4.Columns[0].Title.Color:= clred;

    field_name2:= DBGridEh5.Columns[0].FieldName;
    PreColumn2:= DBGridEh5.Columns[0];
    DBGridEh5.Columns[0].Title.Color:= clred;
  end;

  if PageControl1.ActivePageIndex = 2  then
  begin
    DM.ADO492.Close;
    DM.ADO492.Parameters[0].Value := DM.D08.FieldValues['PROD_CODE'];
    DM.ADO492.Open;
//    DM.wzcp0492.Close;
//    DM.wzcp0492.Parameters[0].Value := DM.ADO492.FieldValues['rkey'];
//    DM.wzcp0492.Open;

    field_name := dgh_grd1.Columns[0].FieldName;
    PreColumn := dgh_grd1.Columns[0];
    dgh_grd1.Columns[0].Title.Color := clred ;
    label1.Caption := dgh_grd1.Columns[0].Title.Caption;
  end;

  if PageControl1.ActivePageIndex = 3  then
  begin
    ADO70.Close;
    ADO70.Parameters[0].Value := DM.D08RKEY.AsString;
    ADO70.Open;
    field_name := DBGridEh1.Columns[0].FieldName;
    PreColumn := DBGridEh1.Columns[0];
    DBGridEh3.Columns[0].Title.Color := clred ;
  end;
end;

procedure TFrm_BOM.edt_1Change(Sender: TObject);
begin
  with DM.cds_wzcp0492 do
  if trim(edt_1.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
  if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dgh_grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dgh_grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      dgh_grd1.DataSource.DataSet.Filter:='';
  end;    
end;

procedure TFrm_BOM.dgh_grd1TitleClick(Column: TColumnEh);
var
  OldIndex: string;
begin
  inherited;

    if dgh_grd1.DataSource.DataSet.IsEmpty then exit;

      //排序
  if GetKeyState(vk_Shift)<0 then  //实现排序要同时按下Shift键
  if  Column.Grid.DataSource.DataSet.Active then
  if  Column.Field<>nil then
  begin
    if ( Column.Field.DataType <> ftBlob)and(Column.Field.FieldKind=fkData) then
    with (Column.Grid.DataSource.DataSet as TClientDataSet) do
    begin
      OldIndex:= DM.cds_wzcp0492.IndexName;
      if OldIndex <> '' then
      begin
        IndexName:= '';
        DeleteIndex(OldIndex);
      end;
      case Column.Title.SortMarker of
        smNoneEh,smUpEh  :
        begin
          AddIndex(column.Field.FieldName, Column.Field.FieldName, [ixDescending]);
          Column.Title.SortMarker:= smDownEh;
        end;
        smDownEh:
        begin
          AddIndex(column.Field.FieldName, Column.Field.FieldName, [ixPrimary]);
          Column.Title.SortMarker:= smUpEh;
        end;
      end;
      IndexName:= column.Field.FieldName;
    end;
  end;
  {
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADS468.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADS468.Sort:=Column.FieldName+' DESC';
  end;  }

  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label5.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure TFrm_BOM.DBGridEh3TitleClick(Column: TColumnEh);
begin
  if DBGridEh3.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ADO70.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADO70.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh3.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end;
end;

procedure TFrm_BOM.DBGridEh4TitleClick(Column: TColumnEh);
begin

  if DBGridEh4.DataSource.DataSet.IsEmpty then exit;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.aqCP140.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.aqCP140.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh4.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name1 <> column.FieldName) then
  begin
    label8.Caption := column.Title.Caption ;
    field_name1 := column.FieldName ;
    edit4.SetFocus;
    PreColumn1.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn1 := column ;
    Edit3Change(Edit3);
  end else
    edit4.SetFocus;
end;

procedure TFrm_BOM.DBGridEh5TitleClick(Column: TColumnEh);
begin
   if DBGridEh5.DataSource.DataSet.IsEmpty then exit;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.aqCP148.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.aqCP148.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh5.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name2 <> column.FieldName) then
  begin
    label7.Caption := column.Title.Caption ;
    field_name2 := column.FieldName ;
    edit3.SetFocus;
    PreColumn2.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
    Edit3Change(Edit3);
  end else
    edit3.SetFocus;
end;

procedure TFrm_BOM.Edit3Change(Sender: TObject);
var
  DBGridEh: TDBGridEh;
  field_name: string;
begin
  if (Sender as TEdit).Name = 'Edit4' then
  begin
    DBGridEh:= DBGridEh4;
    field_name:= field_name1;
  end
  else
  begin
    DBGridEh:= DBGridEh5;
    field_name:= field_name2;
  end;
  if DBGridEh.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger] then
  begin
    if trim((Sender as TEdit).Text) <> '' then
    begin
      if DBGridEh.DataSource.DataSet.FieldByName(field_name).DataType in [ftString, ftWideString] then
        DBGridEh.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim((Sender as TEdit).text) + '%'')'
      else if DBGridEh.DataSource.DataSet.FieldByName(field_name).DataType in [ftSmallint, ftInteger] then
        DBGridEh.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef((Sender as TEdit).text,0))+')';
    end
    else
      DBGridEh.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_BOM.MenuItem1Click(Sender: TObject);
var
  rkey140: Integer;
begin
  case TMenuItem(Sender).Tag of
  0,1:
  begin
    frmMatPriceEdt:= TfrmMatPriceEdt.Create(nil);
    try
      if TMenuItem(Sender).Tag = 0 then
        frmMatPriceEdt.Caption:= frmMatPriceEdt.Caption+'-新增'
      else
        frmMatPriceEdt.Caption:= frmMatPriceEdt.Caption+'-编辑';
      frmMatPriceEdt.Ftag:= TMenuItem(Sender).Tag;
      frmMatPriceEdt.init(Label4.Caption);
      if frmMatPriceEdt.ShowModal = mrok then
      begin
        Edit1.Text:='';
        Edit2.Text:='';
      end;
    finally
      frmMatPriceEdt.Free;
    end;
  end;
  2:begin  //删除
      if DM.aqCP140status.Value = 1 then
      begin
        ShowMessage('此材料报价已审核,不允许删除!');
        Exit;
      end
      else if MessageBox(Handle,'确定删除此材料报价吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDYES then
      begin
        try
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:='delete from WZCP0140 where rkey='+DM.aqcp140rkey.AsString;
          DM.Tmp.ExecSQL;
          DM.CDS148.Close;
          DM.aqCP148.Close;
          DM.aqCP148.Parameters[0].Value:= DM.aqcp140rkey.Value;
          DM.aqCP148.Parameters[1].Value:= DM.aqcp140rkey.Value;
          DM.aqCP148.Open;
          DM.CDS148.Open;
        except
          on E: Exception do
          begin
            ShowMessage('删除材料报价失败:'+E.Message);
          end;
        end;
      end;
    end;
  3:begin  //审核
     if (strtoint(vprev)<>2) and (strtoint(vprev)<>4) then
     begin
       messagedlg('对不起!您没有该程序的审核权限',mtinformation,[mbok],0);
       Exit;
     end;

      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select getdate() as NowDateTime';
      DM.Tmp.Open;
      try
        DM.ADOCon.BeginTrans;
        DM.aqCP140.Edit;
        DM.aqCP140status.Value:=1;
        DM.aqCP140user_ptr.Value:=strtoint(user_ptr);
        DM.aqCP140auth_date.Value:=DM.Tmp.Fields[0].AsDateTime;
        DM.aqCP140.UpdateBatch();
        DM.ADOCon.CommitTrans;
      except
        on E: Exception do
        begin
          DM.ADOCon.RollbackTrans;
          showmessage('数据保存发生错误:'+E.Message);
        end;
      end;
    end;
  4:begin  //反审核
     if (strtoint(vprev)<>4) then
     begin
       messagedlg('对不起!您没有该程序的反审核权限',mtinformation,[mbok],0);
       Exit;
     end;
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='update WZCP0140 set status=0,user_ptr=null,auth_date=null where status=1 and rkey='+DM.aqCP140rkey.AsString;
      if DM.Tmp.ExecSQL<>1 then showmessage('数据状态发生变化,反审核失败');
    end;
  5:begin  //作废
      try
        DM.ADOCon.BeginTrans;
        dm.aqCP140.Edit;
        dm.aqCP140status.Value:=2;
        dm.aqCP140.UpdateBatch();
        DM.ADOCon.CommitTrans;
      except
        on E: Exception do
        begin
          DM.ADOCon.RollbackTrans;
          ShowMessage('作废失败:'+E.Message);
        end;
      end;
    end;
  end;
  rkey140:= dm.aqCP140rkey.Value;
  dm.aqCP140.Close;
  dm.aqCP140.Open;
  if rkey140>0 then dm.aqCP140.Locate('rkey',rkey140,[]);
end;

procedure TFrm_BOM.FormShow(Sender: TObject);
begin
  Frm_BOM.PageControl1.ActivePageIndex := 0;
  //N_select.Enabled := False;

end;

procedure TFrm_BOM.PopupMenu2Popup(Sender: TObject);
begin
  MenuItem1.Enabled:= (vprev='2') or (vprev='4');
  MenuItem2.Enabled:= not DM.aqCP140.IsEmpty and N1.Enabled and (DM.aqCP140status.Value=0);
  MenuItem3.Enabled:= MenuItem2.Enabled;

  MenuItem5.Enabled:= not DM.aqCP140.IsEmpty and (vprev='4') and (DM.aqCP140status.Value=0);
  MenuItem6.Enabled:= not DM.aqCP140.IsEmpty and (vprev='4') and (DM.aqCP140status.Value=1);
  MenuItem8.Enabled:= N2.Enabled;
end;

procedure TFrm_BOM.BitBtn5Click(Sender: TObject);
//var i, IsMessage: Integer;
begin
  {IsMessage := 0;
  DM.ADO140.DisableControls;
  DM.ADO140.First;
  for i := 0 to DM.ADO140.RecordCount - 1 do
  begin
    if DM.ADO140.FieldByName('status').Value = 1 then
    begin
      IsMessage := 1;
    end;
    DM.ADO140.Next;
  end;
  DM.ADO140.EnableControls;
  if IsMessage = 1 then
  begin

  end;}
    FrmMessage := TFrmMessage.Create(Application);
    FrmMessage.ShowModal;
    FrmMessage.Free;
end;

procedure TFrm_BOM.N11Click(Sender: TObject);
begin
   if strtoint(vprev)<>4 then
   begin
     messagedlg('对不起!您的权限不够，请联系管理员',mtinformation,[mbok],0);
     Exit;
   end;
   with DM.Tmp do
   begin
     Close;
     SQL.Clear;
     SQL.Text := 'select status from data0140 where rkey='+DM.ADO140RKEY.AsString;
     Open;
     if (not IsEmpty) and (FieldByName('status').Value <> 1) then
     begin
       ShowMessage('工程未审，请联系工程相关人员进行审核！');
       Exit;
     end;
   end;
   DM.Tmp.Close;
   DM.Tmp.SQL.Text:='select getdate()';
   DM.Tmp.Open;
   try
     DM.ADOCon.BeginTrans;

     DM.ADO140.Edit;
     DM.ADO140user2_ptr.Value:=strtoint(user_ptr);
     DM.ADO140auth2_date.Value:=DM.Tmp.Fields[0].AsDateTime;
     DM.ADO140.Post;

     DM.Tmp.Close;
     DM.Tmp.SQL.Text:='update data0008 set total_cost=(SELECT isnull(SUM(dbo.DATA0148.STD_COST * dbo.DATA0148.QUAN_BOM),0) '+
                      'FROM dbo.DATA0140 INNER JOIN dbo.DATA0148 ON dbo.DATA0140.rkey = dbo.DATA0148.PART_PTR '+
                      'WHERE (dbo.DATA0140.part_ptr ='+DM.D08RKEY.AsString+' ) AND (dbo.DATA0140.status = 3)) '+
                      'where rkey='+DM.D08RKEY.AsString;
     DM.Tmp.ExecSQL;

     DM.ADOCon.CommitTrans;
   except
      on E: Exception do
      begin
        DM.ADOCon.RollbackTrans;
        showmessage('数据保存发生错误:'+E.Message);
      end;
   end;
   BitBtn3Click(nil);
end;

procedure TFrm_BOM.N12Click(Sender: TObject);
begin
   if strtoint(vprev)<>4 then
   begin
     messagedlg('对不起!您的权限不够，请联系管理员',mtinformation,[mbok],0);
     Exit;
   end;
   with DM.Tmp do
   begin
     Close;
     SQL.Clear;
     SQL.Text := 'select user2_ptr from data0140 where rkey='+DM.ADO140RKEY.AsString;
     Open;
     if IsEmpty then
     begin
       ShowMessage('工程未审，请联系工程相关人员进行审核！');
       Exit;
     end;
   end;
   DM.Tmp.Close;
   DM.Tmp.SQL.Text:='update data0140 set status=1,user2_ptr=null,auth2_date=null where rkey='+DM.ADO140rkey.AsString;
   if DM.Tmp.ExecSQL <> 1 then showmessage('数据状态发生变化,反审核失败')
   else
   begin
     DM.Tmp.Close;
     DM.Tmp.SQL.Text:='update data0008 set total_cost=(SELECT SUM(dbo.DATA0148.STD_COST * dbo.DATA0148.QUAN_BOM) '+
                      'FROM dbo.DATA0140 INNER JOIN dbo.DATA0148 ON dbo.DATA0140.rkey = dbo.DATA0148.PART_PTR '+
                      'WHERE (dbo.DATA0140.part_ptr ='+DM.D08RKEY.AsString+' ) AND (dbo.DATA0140.status = 1)) '+
                      'where rkey='+DM.D08RKEY.AsString;
     DM.Tmp.ExecSQL;
   end;
   BitBtn3Click(nil);
end;

procedure TFrm_BOM.Button1Click(Sender: TObject);
begin
  if not DM.ADO140.IsEmpty then
  begin
    DBGridEh2.DataSource:=DM.ds148s;
    DM.ADO148s.Close;
    DM.ADO148s.Parameters[0].Value := DM.ADO140rkey.Value;
    DM.ADO148s.Parameters[1].Value := DM.ADO140rkey.Value;
    DM.ADO148s.Open;
    Frm_BOM_u.Frm_BOM.LBOMName.Caption := '当前显示物料清单所属BOM名称: '
      + DM.ADO140part_name.AsString + '   材料清单总数目: ' +IntToStr(dm.ADO148s.RecordCount);
  end;
end;

procedure TFrm_BOM.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then   
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)  ;
  end;
end;

procedure TFrm_BOM.dgh_grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then   
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TClientDataSet then
      showmessage((DataSet as  TClientDataSet).CommandText)  ;
  end;
end;

procedure TFrm_BOM.PopupMenu3Popup(Sender: TObject);
begin
//状态=已审核，不审核
//  if (dm.ADO492.RecordCount=0) then N_UpdateBOM.Enabled:=False
//  else if (DM.ADO492TSTATUS.AsInteger in [0,2])and(StrToInt(vprev)in[2,3,4]) then
//    N_UpdateBOM.Enabled := True
//  else
//    N_UpdateBOM.Enabled := False;
end;

procedure TFrm_BOM.N_UpdateBOMClick(Sender: TObject);
var
  str_SQL,str_INV_PART_NUMBER:string;
begin
//对工程BOM进行汇总，先用现有的生产BOM记录进行循环，如果用量出现差异，更改生产BOM的数量；
//如果有些材料根本不存在，1如果已经有领用，修改标准用量为0，2如果没领用，删除
//用工程BOM进行汇总的结果进行循环，如果在生产BOM表没有找到，添加
  with ADODataSet2 do
  begin
    Close;
//    CommandText := 'select data0148.rkey,data0148.INVENT_PTR,data0148.QUAN_BOM * '+dm.ADO492.FieldByName('ISSUED_QTY').AsString+' STD_QTY '+#13
//                   +'from data0140 join data0148 on data0140.rkey = data0148.[PART_PTR]  and data0140.status = 1'+#13
//                   +'join data0008 on data0140.part_ptr = data0008.rkey '+#13                 //
//                   +'where (data0140.part_ptr = '+dm.ADO492.FieldByName('BOM_PTR').AsString+')and(dbo.DATA0148.Invent_or = 0)'+#13
//                   +'order by data0008.PROD_CODE';

//lisa 20170508改
  CommandText:=Format('declare @sql nvarchar(max)' +
  #13#10 + 'set @sql='''  +' with bomlist(parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,quantity) as '
        + #13#10 +'(select a.part_ptr, 1+0 as lvl ,b.invent_or,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148, '
        + #13#10 +'a.part_name as bomname,b.quan_bom as pcs,b.quan_bom  as quantity  '
        + #13#10 +'from data0140 as a join       '
        + #13#10 +'data0148 as b  on a.rkey =b.part_ptr  '
        + #13#10 +'where   a.status=1 and  a.part_ptr= %d  '
        + #13#10 +'union all            '
        + #13#10 +'select a.part_ptr, 1+e.lvl as lvl ,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rkey as rk148,  a.part_name, '
        + #13#10 +'b.quan_bom,  b.quan_bom*e.quantity  as quan_bom   '
        + #13#10 +'from data0140 as a                             '
        + #13#10 +'join data0148 as b  on a.rkey=b.part_ptr    '
        + #13#10 +'join  bomlist e on e.rk08= a.part_ptr '
        + #13#10 +'where  e.ior=1 and a.status=1)     '
        + #13#10 +'select  parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,code ,name,u,unit_name,sum(quantity)as STD_QTY '
        + #13#10 +'from               '
        + #13#10 +'(select   a.*,   '
        + #13#10 +'case when a.ior=1  then b.PRODUCT_NAME else c.inv_part_number end as code,  '
        + #13#10 +'case when a.ior=1  then b.prod_code else c.INV_PART_DESCRIPTION end as name, '
        + #13#10 +'case when a.ior=1 then  b.unit_ptr else c.stock_unit_ptr end   as u,        '
        + #13#10 +'case when a.ior=1 then  bb.unit_name else  cc.unit_name  end   as  unit_name, '
        + #13#10 +'0 as  ctrl                                          '
        + #13#10 +'from bomlist  a                          '
        + #13#10 +'left  join data0008  b on a.rk08=b.rkey  '
        + #13#10 +'left join data0002 bb on b.unit_ptr=bb.rkey '
        + #13#10 +'left join data0017 c on  a.rk08=c.rkey        '
        + #13#10 +'left join data0002 cc on c.stock_unit_ptr=cc.rkey  '
        + #13#10 +'where ior=0)aa                                  '
        + #13#10 +'group by parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,code ,name,u,unit_name  '''+
        #13#10 + 'exec sp_executesql @sql' + #13#10,[dm.ADO492.FieldByName('BOM_PTR').asinteger]);
     //howMessage(ADODataSet2.sql.Text);

    Open;

  end;

  Screen.Cursor := crHourGlass;
  try
    str_SQL:='';
    try
      if  DM.ADOCon.InTransaction then
      DM.ADOCon.RollbackTrans;
      DM.ADOCon.BeginTrans;
      str_INV_PART_NUMBER :=  DM.cds_wzcp0492 .FieldByName('INV_PART_NUMBER').AsString;
      DM.cds_wzcp0492.DisableControls;
      with DM.cds_wzcp0492 do
      begin
        First;
        while not Eof do       //遍历dt_wzcp0492表，
        begin
          if ADODataSet2.Locate('rk08;rk148',
            VarArrayOf([FieldByName('D017_ptr').AsString,FieldByName('D148_PTR').AsString]),[]) then   //  如果在ADODataSet2中找到，且数量不同，修改
          begin
            if  ADODataSet2.FieldByName('STD_QTY').Value <> FieldByName('STD_QTY').Value then
            begin
              Edit;
              FieldByName('STD_QTY').Value := ADODataSet2.FieldByName('STD_QTY').Value;
              Post;
            end;
          end
          else                  //如果在ADODataSet2中没找到,
          begin
            Edit;
            FieldByName('STD_QTY').Value := 0;
            Post;
            if FieldByName('App_QTY').Value = 0  then     // 已申请
            if FieldByName('Con_QTY').Value = 0  then     // 如果领用数量=0，
            if FieldByName('QUAN_ASSIGN').Value = 0  then //如果分配数量=0  QUAN_ASSIGN已分配
            begin
              Delete;
              Continue;        //结束当前循环
            end;
          end;
          Next;
        end;
      end;

      if DM.cds_wzcp0492.ApplyUpdates(0) = 0 then
      begin

        with ADODataSet2 do
        begin
          First;
          while not Eof do                     //遍历ADODataSet2表，ADODataSet2是最新的工程BOM和投产数量的和
          begin

            if DM.cds_wzcp0492.Locate('D017_ptr;D148_PTR',
              VarArrayOf([FieldByName('rk08').AsString,FieldByName('rk148').AsString]),[]) =False then   //如果在原生产BOM中没找到，生成插入语句
            begin
              str_SQL := str_SQL+ 'insert into wzcp0492([D492_ptr],D148_PTR,[D017_ptr],[STD_QTY],[App_QTY],[Con_QTY],[QUAN_ASSIGN]) '+#13
                       +'values('+dm.ADO492rkey.AsString+','+ FieldByName('rk148').AsString+','
                       + FieldByName('rk08').AsString+','+  FieldByName('STD_QTY').AsString+',0,0,0)'+#13;
            end;

            Next;
          end;
        end;

//        ShowMessage(str_SQL);
        if  str_SQL<>'' then
        begin

          DM.cmd1.CommandText := str_SQL;
         
          DM.cmd1.Execute;

        end;

        DM.ADOCon.CommitTrans;
      end
      else
      begin
       // ShowMessage('更新失败，原因是状态发生改变');
        DM.ADOCon.RollbackTrans;
      end;
    except
      on e:Exception do
      begin
        if  DM.ADOCon.InTransaction then
        DM.ADOCon.RollbackTrans;
        ShowMessage('更新失败，原因是：'+#13#10+e.Message);
      end;
    end;
  finally
    DM.cds_wzcp0492.Close;
    DM.cds_wzcp0492.Open;
    DM.cds_wzcp0492.Locate('INV_PART_NUMBER',str_INV_PART_NUMBER,[]);
    DM.cds_wzcp0492.EnableControls;
    Screen.Cursor := crDefault;
  end;

end;

procedure TFrm_BOM.N_selectClick(Sender: TObject);
begin
    if DBGridEh2.DataSource.DataSet.FieldByName('invent_tp').AsString ='半成品' then
    begin
      try
        Form_SEE := TForm_SEE.Create(Application);
      finally
        Form_SEE.ShowModal;
        Form_SEE.Free;
      end;
    end

end;

procedure TFrm_BOM.DBGridEh2CellClick(Column: TColumnEh);
begin
    if  DBGridEh2.DataSource.DataSet.FieldByName('invent_tp').AsString ='半成品'  then
      begin
        N_select.Enabled := True
      end
    else
      begin
        N_select.Enabled := False;
      end;
end;

procedure TFrm_BOM.DBGridEh2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    if  DBGridEh2.DataSource.DataSet.FieldByName('invent_tp').AsString ='半成品'  then
      begin
        N_select.Enabled := True
      end
    else
      begin
        N_select.Enabled := False;
      end;
end;

end.
