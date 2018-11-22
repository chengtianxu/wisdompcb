unit Frm_ZZrecv_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, Mask, DBCtrls,
  DBCtrlsEh, DB, ADODB, Menus, ActnList, DBClient,StrUtils,DateUtils;

type
  TFrm_ZZrecv = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    Panel4: TPanel;
    SGrid: TStringGrid;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    Label8: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Label2: TLabel;
    Panel6: TPanel;
    Label1: TLabel;
    ActionList1: TActionList;
    ActSv: TAction;
    ActEsc: TAction;
    Label10: TLabel;
    Edit2: TEdit;
    Label9: TLabel;
    Edit3: TEdit;
    SpeedButton5: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit4: TEdit;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure SGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    Ftp:integer;     //仓库类型 1:store 2:wait YM 3:machine 4:YM 5:RejStore
    Foptp:integer;   //操作类型 1:store to machice 2:machice to store 3:to YM 4:YM to store
    PreColumn: TColumnEh;
    field_name:string;
    procedure SetCdsIndexName(cds: TClientDataSet; ColumnFieldName: string);
  public
     class procedure init(optp:integer);
  end;

var
  Frm_ZZrecv: TFrm_ZZrecv;

implementation
uses common,DM_u,ConstVar ,Pick_Item_Single,Frm_RecvDetail_u, Pas_Dele_u;
{$R *.dfm}
procedure TFrm_ZZrecv.SetCdsIndexName(cds: TClientDataSet;ColumnFieldName: string);
var
  lIndexName: string;
begin
  inherited;
  if not cds.Active then Exit;
  if cds.FieldByName(ColumnFieldName).FieldKind <> fkData then
  begin
    if cds.FieldByName(ColumnFieldName).FieldKind = fkLookup then
      ColumnFieldName := cds.FieldByName(ColumnFieldName).KeyFields
    else
      exit;
  end;
  lIndexName := cds.IndexName;
  if lIndexName <> '' then
    cds.DeleteIndex(lIndexName);
  if AnsiContainsText(lIndexName, ColumnFieldName) then
  begin
    if AnsiContainsText(lIndexName, 'desc') then
    begin
      lIndexName := ColumnFieldName;
      cds.AddIndex(lIndexName, ColumnFieldName, []);
    end
    else
      lIndexName := '';
  end
  else
  begin
    lIndexName := ColumnFieldName + ' desc';
    cds.AddIndex(lIndexName, ColumnFieldName, [ixDescending]);
  end;
  cds.IndexName := lIndexName;
end;


class procedure TFrm_ZZrecv.init(optp: integer);
begin
  with TFrm_ZZrecv.Create(nil) do
  try
    Foptp:=optp;
    SGrid.ColCount:=12;
    SGrid.RowCount:=2;
    SGrid.Cells[0,0]:='位置代码';
    SGrid.Cells[1,0]:='位置名称';
    SGrid.Cells[2,0]:='钻嘴编码';
    SGrid.Cells[3,0]:='钻嘴名称';
    SGrid.Cells[4,0]:='研磨次数';
    SGrid.Cells[5,0]:='收回数量';
    SGrid.Cells[6,0]:='备注';
    SGrid.Cells[7,0]:='rkey17';
    SGrid.Cells[8,0]:='rkey160';
    SGrid.Cells[9,0]:='rkey220';
    SGrid.Cells[10,0]:='supplier_ptr';
    SGrid.Cells[11,0]:='iNumber';//剩余数量

    SGrid.ColWidths[0]:=80;
    SGrid.ColWidths[1]:=80;
    SGrid.ColWidths[2]:=80;
    SGrid.ColWidths[3]:=120;
    SGrid.ColWidths[4]:=80;
    SGrid.ColWidths[5]:=80;
    SGrid.ColWidths[6]:=160;
    SGrid.ColWidths[7]:=-1;
    SGrid.ColWidths[8]:=-1;
    SGrid.ColWidths[9]:=-1;
    SGrid.ColWidths[10]:=-1;
    SGrid.ColWidths[11]:=-1;


    MaskEdit1.Text := dm.Get_Data0004(0) ;
    MaskEdit1.ReadOnly:=true;

    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DM.ADO219.Open;
    DM.ADO219.Append;
    DM.ADO219.FieldByName('CREATE_DATE').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
    DM.ADO219.FieldByName('SYSTEM_DATE').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
    DM.ADO219.FieldByName('TTYPE').AsInteger:=1;
    DM.ADO219.FieldByName('CREATE_BY').asstring:=user_ptr;
    DM.ADO219.FieldByName('TTYPE').AsInteger:=optp;
    if optp=2 then
    begin
      Ftp:=1;
      caption:='从机器上回仓';
      Label10.Caption:='主轴数';
    end else begin
      Ftp:=2;
      caption:='从研磨供应商回仓';
      Label7.Caption:='研磨供应商代码';
      Label1.Caption:='当前研磨供应商所有钻嘴' ;
    end;
    showmodal;
  finally
    free;
  end;
end;

procedure TFrm_ZZrecv.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_ZZrecv.SpeedButton3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
    if Foptp=2 then
    begin
      InputVar.Fields := 'location_code/机器代码/80,location_name/机器名称/150,oh_degree/主轴数/120,remark/备注/200';
      InputVar.Sqlstr :='select rkey,location_code,location_name,oh_degree,remark from data0160 where type=3';
    end else begin
      InputVar.Fields := 'location_code/研磨供应商代码/100,location_name/研磨供应商名称/150,remark/备注/200';
      InputVar.Sqlstr :='select rkey,location_code,location_name,remark from data0160 where type=4';
    end;
    InputVar.AdoConn := DM.ADOCon ;
    frmPick_Item_Single2.InitForm_New(InputVar)  ;
    if frmPick_Item_Single2.ShowModal = mrok then
    begin
      if frmPick_Item_Single2.adsPick.IsEmpty then exit;
      Edit1.Text := frmPick_Item_Single2.adsPick.fieldbyname('location_code').asstring;
      label8.Caption := frmPick_Item_Single2.adsPick.fieldbyname('location_name').asstring;
      if Foptp=2 then
        Edit2.text := frmPick_Item_Single2.adsPick.fieldbyname('oh_degree').asstring
      else
        Edit2.text := frmPick_Item_Single2.adsPick.fieldbyname('remark').asstring;
      DM.ADO219.FieldByName('location_fromptr').AsInteger:=frmPick_Item_Single2.adsPick.fieldbyname('rkey').AsInteger ;

      DM.ADO160.Filter:='';
      DM.ADO160.Close;
      DM.ADO160.SQL.Text:='select data0219.grn_number,data0219.create_date,data0160.location_code,data0160.location_name,'+
                          'data0017.INV_PART_NUMBER, data0017.inv_part_description,'+
                          '(data0220.quan_on_hand-data0220.quan_alloc) Quan_valid,data0220.oh_degree,'+
                          'data0017.RKEY rkey17, data0160.rkey rkey160,data0220.rkey rkey220,data0160.type,data0220.supplier_ptr, '+
                          'case data0160.type when 1 then ''库房'' when 2 then ''待研磨仓'' when 3 then ''机器'' '+
                          'when 4 then ''研磨商'' when 5 then ''报废仓''  end  Type_c,data0220.remark '+
                          'from data0160 inner join data0220 on data0160.rkey=data0220.location_ptr '+
                          'inner join data0017 on data0220.inventory_ptr=data0017.rkey '+
                          'inner join data0219 on data0220.grn_ptr=data0219.rkey '+
                          'where data0160.rkey='+DM.ADO219.FieldByName('location_fromptr').AsString+
                          ' and data0220.quan_on_hand-data0220.quan_alloc>0 order by dbo.data0160.oh_degree,dbo.data0219.create_date,data0220.quan_on_hand';
      Dm.ADO160.Open;
      DM.DS160.DataSet:=DM.cds160;
      DM.cds160.data:=DM.pr160.Data;
      DM.dp160.DataSet:=DM.cds160;
      DM.cds160a.data:=DM.pr160.Data;
    end ;
    if Foptp=2 then
    begin
      field_name:='INV_PART_NUMBER';
      PreColumn := DBGridEh1.Columns[0] ;
      PreColumn.Title.Color := clred ;
    end else
    if Foptp=4 then
    begin
      field_name:=DBGridEh1.Columns[0].FieldName;
      PreColumn := DBGridEh1.Columns[0] ;
      PreColumn.Title.Color := clred ;
    end;
  finally
    frmPick_Item_Single2.adsPick.Close;
    frmPick_Item_Single2.Free ;
  end;
end;

procedure TFrm_ZZrecv.Edit1Exit(Sender: TObject);
var s:string;
begin
  if Edit1.Text<>'' then
  begin
    if Foptp=2 then s:='3' else s:='4';
    DM.tmp.SQL.Text:='select rkey,location_code,location_name,oh_degree,remark from data0160 where location_code='''+
                     Edit1.Text+''' and type='+s;
    DM.tmp.Open;
    if not DM.tmp.IsEmpty then
    begin
      label8.Caption := DM.tmp.fieldbyname('location_name').asstring;
      if Foptp=2 then
        Edit2.text := DM.tmp.fieldbyname('oh_degree').asstring
      else
        Edit2.text := DM.tmp.fieldbyname('remark').asstring;
      DM.ADO219.Edit;
      DM.ADO219.FieldByName('location_fromptr').AsInteger:=DM.tmp.fieldbyname('rkey').AsInteger ;
      DM.ADO160.Filter:='';
      DM.ADO160.Close;
      DM.ADO160.SQL.Text:='select data0219.grn_number,data0219.create_date,data0160.location_code,data0160.location_name,'+
                          'data0017.INV_PART_NUMBER, data0017.inv_part_description,'+
                          '(data0220.quan_on_hand-data0220.quan_alloc) Quan_valid,data0220.oh_degree,'+
                          'data0017.RKEY rkey17, data0160.rkey rkey160,data0220.rkey rkey220,data0160.type,data0220.supplier_ptr, '+
                          'case data0160.type when 1 then ''库房'' when 2 then ''待研磨仓'' when 3 then ''机器'' '+
                          'when 4 then ''研磨商'' when 5 then ''报废仓''  end  Type_c,data0220.remark '+
                          'from data0160 inner join data0220 on data0160.rkey=data0220.location_ptr '+
                          'inner join data0017 on data0220.inventory_ptr=data0017.rkey '+
                          'inner join data0219 on data0220.grn_ptr=data0219.rkey '+
                          'where data0160.rkey='+DM.ADO219.FieldByName('location_fromptr').AsString+
                          ' and data0220.quan_on_hand-data0220.quan_alloc>0 order by data0160.oh_degree,data0219.create_date,data0220.quan_on_hand';
      Dm.ADO160.Open;
      DM.DS160.DataSet:=DM.cds160;
      DM.cds160.data:=DM.pr160.Data;
    end else begin
      if  Foptp=1 then
        showmessage('机器代码错误...')
      else
        showmessage('研磨供应商代码错误...');
      Edit1.SetFocus;
      abort;
    end;
  end;
end;

procedure TFrm_ZZrecv.SpeedButton2Click(Sender: TObject);
var i:integer;
    s:string;
    tmpAdo:TADOQuery;
begin
  if MaskEdit1.Text='' then
  begin
    showmessage('单号不能为空...');
    exit;
  end;

  if (Edit1.Text='') and (Ftp=1) then
  begin
    showmessage('机器代码不能为空...');
    exit;
  end else if (Edit1.Text='') and (Ftp=2) then
  begin
    showmessage('研磨供应商代码不能为空...');
    exit;
  end;

  if DBEdit2.Text='' then
  begin
    showmessage('经办人不能为空...');
    exit;
  end;
  if SGrid.RowCount=2 then
  begin
    showmessage('不能保存空记录...');
    exit;
  end;

  tmpAdo:=TADOQuery.Create(Application);
  tmpAdo.Connection:=dm.ADOCon;
  try
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0223 where dBeginDate>=:DM1 and dEndDate<=:DM2 and iStatus=1');
    tmpAdo.Parameters.ParamByName('DM1').Value:=FormatDateTime('yyyy-mm-dd',StartOfTheMonth(DBDateTimeEditEh1.Value));
    tmpAdo.Parameters.ParamByName('DM2').Value:=FormatDateTime('yyyy-mm-dd',EndOfTheMonth(DBDateTimeEditEh1.Value));
    tmpAdo.Open;
    if not tmpAdo.Eof then
    begin
      ShowMsg('该月的月末平衡表已审核，不可操作！',1);
      Exit;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;

  MaskEdit1.Text := dm.Get_Data0004(1,MaskEdit1.Text) ;
  DM.ADO219.FieldByName('GRN_NUMBER').AsString:=MaskEdit1.Text;
  DM.ADO220.Open;
  DM.ADO270.Open;
  DM.ADOCon.BeginTrans;
  try
    DM.ADO219.UpdateBatch(arAll);                                    
    for i:=1 to SGrid.RowCount-2 do
    begin
      DM.ADO220.Append;
      DM.ADO220.FieldByName('grn_ptr').AsInteger:=DM.ADO219.fieldbyname('rkey').AsInteger;
      DM.ADO220.FieldByName('inventory_ptr').AsString:=SGrid.Cells[7,i];
      DM.ADO220.FieldByName('supplier_ptr').AsString:=SGrid.Cells[10,i];
      DM.ADO220.FieldByName('location_ptr').AsString:=SGrid.Cells[8,i];
      DM.ADO220.FieldByName('oh_degree').AsString:=SGrid.Cells[4,i];
      DM.ADO220.FieldByName('quantity').AsString:=SGrid.Cells[5,i];
      DM.ADO220.FieldByName('quan_on_hand').AsString:=SGrid.Cells[5,i];
      DM.ADO220.FieldByName('remark').AsString:=SGrid.Cells[6,i];
      DM.ADO220.FieldByName('supplier_ptr').AsString:=SGrid.Cells[10,i];
      DM.ADO220.Post;

      DM.ADO270.Append;
      DM.ADO270.FieldByName('bach_fromptr').AsString:=SGrid.Cells[9,i];
      DM.ADO270.FieldByName('bach_endptr').AsString:=DM.ADO220.FieldByName('rkey').AsString;
      DM.ADO270.FieldByName('empl_ptr').AsString:=user_ptr;
      DM.ADO270.FieldByName('Tdate').AsDateTime:=DM.ADO219.FieldByName('system_date').AsDateTime;
      DM.ADO270.FieldByName('quantity').AsString:=SGrid.Cells[5,i];
      DM.ADO270.FieldByName('type').AsString:=DM.ADO219.FieldByName('TTYPE').AsString;
      DM.ADO270.FieldByName('ref_number').AsString:=SGrid.Cells[6,i];
      DM.ADO270.Post;

      DM.tmp.Close;
      DM.tmp.SQL.Text:='select top 1 type from data0160 where rkey='+SGrid.Cells[8,i];
      DM.tmp.Open;
      if DM.tmp.Fields[0].AsInteger=1 then   //退回
         s:=',quan_returned='+SGrid.Cells[5,i]
      else if DM.tmp.Fields[0].AsInteger=5 then   //报废
         s:=',quan_scrapped='+SGrid.Cells[5,i]
      else s:='';

      DM.tmp.Close;
      DM.tmp.SQL.Text:='update data0220 set quan_on_hand=quan_on_hand-'+SGrid.Cells[5,i]+s+
                       ' where rkey='+SGrid.Cells[9,i]+' and quan_on_hand>='+SGrid.Cells[5,i] ;
      if DM.tmp.ExecSQL=0 then
      begin
        DM.ADOCon.RollbackTrans;
        if Foptp=2 then s:='当前在机数量不足,数据保存失败...'  else s:='当前研磨供应商库存数量不足,数据保存失败...';
        showmessage(SGrid.Cells[0,i]+s);
        abort;
      end;
    end;
    DM.ADO270.UpdateBatch(arAll);
    DM.ADOCon.CommitTrans;
    showmessage('数据保存成功!');
  except
    DM.ADOCon.RollbackTrans;
    showmessage('数据保存失败...');
  end;
  close;
end;

procedure TFrm_ZZrecv.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=not DBGridEh1.DataSource.DataSet.IsEmpty;
end;

procedure TFrm_ZZrecv.PopupMenu2Popup(Sender: TObject);
begin
  N2.Enabled:=not ((SGrid.Row=0) or (SGrid.Row=SGrid.RowCount-1));
 // N4.Enabled:=N2.Enabled;
end;

procedure TFrm_ZZrecv.N1Click(Sender: TObject);
var i,j:integer;
    iSum:Integer;
begin
   Frm_RecvDetail:=TFrm_RecvDetail.Create(nil);
   try
     Frm_RecvDetail.SGrid.ColCount:=6;
     Frm_RecvDetail.SGrid.RowCount:=2;
     Frm_RecvDetail.SGrid.Cells[0,0]:='数量';
     Frm_RecvDetail.SGrid.Cells[1,0]:='仓位代码';
     Frm_RecvDetail.SGrid.Cells[2,0]:='研磨次数';

     Frm_RecvDetail.SGrid.Cells[3,0]:='备注';
     Frm_RecvDetail.SGrid.Cells[4,0]:='rkey160';
     Frm_RecvDetail.SGrid.Cells[5,0]:='仓位名称';
   //  Frm_RecvDetail.SGrid.Cells[6,0]:='仓位类型';

     Frm_RecvDetail.SGrid.ColWidths[4]:=-1;
   //  Frm_RecvDetail.SGrid.ColWidths[5]:=-1;
    // Frm_RecvDetail.SGrid.ColWidths[6]:=-1;

     Frm_RecvDetail.Foptp:=self.Foptp;
     if Foptp=2 then
       Frm_RecvDetail.Label1.Caption:='机器代码'
     else begin
       Frm_RecvDetail.Label1.Caption:='研磨供应商代码';
       Frm_RecvDetail.Button1.Caption:='收回到仓库';
     end;
     Frm_RecvDetail.Edit1.Text:=DM.CDS160.Fieldbyname('location_code').AsString;
     Frm_RecvDetail.Label3.Caption:=DM.CDS160.Fieldbyname('location_name').AsString;
     Frm_RecvDetail.Edit2.Text:=DM.CDS160.Fieldbyname('INV_PART_NUMBER').AsString;
     Frm_RecvDetail.Label8.Caption:=DM.CDS160.Fieldbyname('inv_part_description').AsString;
     Frm_RecvDetail.Edit2.Text:=DM.CDS160.Fieldbyname('INV_PART_NUMBER').AsString;
     Frm_RecvDetail.Edit3.Text:=DM.CDS160.Fieldbyname('oh_degree').AsString;
     Frm_RecvDetail.Edit4.Text:=DM.CDS160.Fieldbyname('Quan_valid').AsString;
     Frm_RecvDetail.Edit5.Text:=DM.CDS160.Fieldbyname('Quan_valid').AsString;

     if Foptp=2 then
     begin
       iSum:=0;
       for i:=1 to SGrid.RowCount-2 do
       begin
         if (SGrid.Cells[4,i]=DM.CDS160.Fieldbyname('oh_degree').AsString) then
         begin
           iSum:=iSum+StrToInt(SGrid.Cells[5,i]);
         end;
       end;
       Frm_RecvDetail.Edit6.Text:=IntToStr(iSum);
       Frm_RecvDetail.Edit7.Text:=IntToStr(iSum+DM.CDS160.Fieldbyname('Quan_valid').AsInteger);
     end
     else
     begin
       iSum:=0;
       for i:=1 to SGrid.RowCount-2 do
       begin
         if ((StrToInt(SGrid.Cells[4,i])-1)=StrToInt(DM.CDS160.Fieldbyname('oh_degree').AsString)) then
         begin
           iSum:=iSum+StrToInt(SGrid.Cells[5,i]);
         end;
       end;
       Frm_RecvDetail.Edit6.Text:=IntToStr(iSum);
       Frm_RecvDetail.Edit7.Text:=IntToStr(iSum+DM.CDS160.Fieldbyname('Quan_valid').AsInteger);
     end;

     if Frm_RecvDetail.ShowModal=mrok then
     begin
       j:=SGrid.RowCount-1;
       for i:=1 to Frm_RecvDetail.SGrid.RowCount-2 do
       begin
          SGrid.Cells[0,j]:=Frm_RecvDetail.SGrid.Cells[1,i];//'位置代码';
          SGrid.Cells[1,j]:=Frm_RecvDetail.SGrid.Cells[5,i];//'位置名称';
          SGrid.Cells[2,j]:=Frm_RecvDetail.Edit2.Text;      //'钻嘴编码';
          SGrid.Cells[3,j]:=Frm_RecvDetail.Label8.Caption;  //'钻嘴名称';

          SGrid.Cells[4,j]:=Frm_RecvDetail.SGrid.Cells[2,i]; //'研磨次数';
          SGrid.Cells[5,j]:=Frm_RecvDetail.SGrid.Cells[0,i];  //'回仓数量';
          SGrid.Cells[6,j]:=Frm_RecvDetail.SGrid.Cells[3,i];  //'备注';
          SGrid.Cells[7,j]:=DM.CDS160.Fieldbyname('rkey17').AsString;  //'rkey17';
          SGrid.Cells[8,j]:=Frm_RecvDetail.SGrid.Cells[4,i];           //'rkey160';
          SGrid.Cells[9,j]:=DM.CDS160.Fieldbyname('rkey220').AsString;  //'rkey220';
          SGrid.Cells[10,j]:=DM.CDS160.Fieldbyname('supplier_ptr').AsString;//'rkeysupplier';
          SGrid.RowCount:=SGrid.RowCount+1;
          inc(j);
       end;
       DM.CDS160.Edit;
       DM.CDS160.FieldByName('quan_valid').AsInteger:=strtoint(Frm_RecvDetail.Edit5.Text);
       DM.CDS160.Post;
       SpeedButton3.Enabled:=false;
       Edit1.Enabled:=false;
     end;

     iSum:=0;
     for i:=1 to SGrid.RowCount-2 do
     begin
       iSum:=iSum+StrToInt(SGrid.Cells[5,i]);
     end;
     Label12.Caption:=IntToStr(iSum);
   finally
     Frm_RecvDetail.Free;
   end;
end;

procedure TFrm_ZZrecv.N2Click(Sender: TObject);
var i,iSum:integer;
begin
  if sgrid.RowCount <= 2 then exit;
  DM.CDS160.Filtered:=false;
  if DM.CDS160.Locate('rkey220',strtoint(SGrid.Cells[9,sgrid.Row]),[]) then
  begin
    DM.CDS160.Edit;
    DM.CDS160.FieldByName('quan_valid').AsInteger:=DM.CDS160.FieldByName('quan_valid').AsInteger+strtoint(SGrid.Cells[5,sgrid.Row]);
    DM.CDS160.Post;
    DM.CDS160.Filtered:=true;
    for i:=sgrid.Row to sgrid.RowCount-2 do sgrid.Rows[i].Text:=sgrid.Rows[i+1].Text;
    sgrid.RowCount:=sgrid.RowCount-1;
    SpeedButton3.Enabled:=sgrid.RowCount=2;
    Edit1.Enabled:=SpeedButton3.Enabled;

     iSum:=0;
     for i:=1 to SGrid.RowCount-2 do
     begin
       iSum:=iSum+StrToInt(SGrid.Cells[5,i]);
     end;
     Label12.Caption:=IntToStr(iSum);

  end else
    DM.CDS160.Filtered:=true;
end;

procedure TFrm_ZZrecv.DBGridEh1DblClick(Sender: TObject);
begin
  if not DBGridEh1.DataSource.DataSet.IsEmpty then N1Click(Sender);
end;

procedure TFrm_ZZrecv.SGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  SGrid.MouseToCell(x,y,column,row);
  if row<>0 then SGrid.Row:=row;
 end;

end;

procedure TFrm_ZZrecv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) and not (ActiveControl is TCustomMemo) and not (ActiveControl is TCustomGrid)  then
   SelectNext(ActiveControl,true,true);
end;

procedure TFrm_ZZrecv.Edit3Change(Sender: TObject);
var i:Integer;
begin
  if (Trim(Edit1.Text)<>'') then
  begin
   i:=0;
    if (Trim(Edit3.Text)<>'') then
      DBGridEh1.DataSource.DataSet.Filter:='Quan_valid>0 and oh_degree= '+Edit3.Text+''
    else
      DBGridEh1.DataSource.DataSet.Filter:='Quan_valid>0';

    DBGridEh1.DataSource.DataSet.DisableControls;
    DBGridEh1.DataSource.DataSet.First;
    while not DBGridEh1.DataSource.DataSet.Eof do
    begin
     i:=i+DBGridEh1.DataSource.DataSet.FieldByName('Quan_valid').AsInteger;
     DBGridEh1.DataSource.DataSet.Next;
    end;

    DBGridEh1.DataSource.DataSet.EnableControls;
    DBGridEh1.Columns[2].Footer.value:=inttostr(i);
    Edit4.Text:=DBGridEh1.Columns[2].Footer.value;
  end;
end;

procedure TFrm_ZZrecv.FormShow(Sender: TObject);
begin
  if (common.rkey73='') then
  begin
    DBEdit2.Text:=common.user_ptr;
  end else
    DBEdit2.Text:= dm.Get0073(StrToInt(common.rkey73));                  
end;

procedure TFrm_ZZrecv.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if not DBGridEh1.DataSource.DataSet.Eof then
  begin
    if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
    if column.Title.SortMarker =smUpEh then
    begin
      SetCdsIndexName(DM.CDS160,Column.FieldName);
  //    DM.CDS160.AddIndex(Column.FieldName,Column.FieldName, [ixDescending]);
      Column.Title.SortMarker:=smDownEh;
    end
    else
    begin
      DM.CDS160.IndexFieldNames:=Column.FieldName;
      Column.Title.SortMarker:=smUpEh;
    end;
    if (field_name <> column.FieldName) then
    begin
      field_name := column.FieldName ;
      PreColumn.Title.Color := clBtnFace ;
      Column.Title.Color := clred ;
      PreColumn := column ;
    end;
  end;
end;

procedure TFrm_ZZrecv.SpeedButton5Click(Sender: TObject);
begin
  Frm_Dele_u := TFrm_Dele_u.Create(application) ;
  try
    Frm_Dele_u.Foptp:=Foptp;
    if Frm_Dele_u.ShowModal = mrok then
    begin
    end;
  finally
    Frm_Dele_u.Free ;
  end;
end;

procedure TFrm_ZZrecv.Button1Click(Sender: TObject);
var i,iQty,iCurQty,iSum:integer;
begin
  if (Trim(Edit1.Text)='') then
  begin
    showmessage('请选择钻机代码...');
    exit;
  end;
  if (Trim(Edit3.Text)='') then
  begin
    showmessage('请选择钻嘴磨次...');
    exit;
  end;
  if (Trim(Edit4.Text)='') then
  begin
    showmessage('请确定回收数量...');
    exit;
  end else
  if (StrToInt(Edit4.Text)=0) then
  begin
    showmessage('回收数量不能为0...');
    exit;
  end;
  if strtoint('0'+Edit4.Text)>strtoint(DBGridEh1.GetFooterValue(0,DBGridEh1.Columns[2]))  then
  begin
    showmessage('回收数量超过当前有效库存...');
    exit;
  end;

  DM.tmp.Close;
  if  Foptp=2 then //机器回仓
  begin
    if (Trim(Edit3.Text)='6') then
    begin
      DM.tmp.SQL.Text :='select rkey,location_code,location_name,oh_degree,remark '+
                      'from data0160 where type=2 and oh_degree=6'
    end else
    begin
      DM.tmp.SQL.Text :='select rkey,location_code,location_name,oh_degree,remark '+
                      'from data0160 where type=2 and oh_degree='+Edit3.Text
    end;
  end else  //研磨房回仓
  begin
    if edit3.Text<>'6' then
      DM.tmp.SQL.Text :='select rkey,location_code,location_name,oh_degree,remark '+
                        'from data0160 where type=1 and oh_degree-1='+Edit3.Text
    else
      DM.tmp.SQL.Text :='select rkey,location_code,location_name,oh_degree,remark '+
                        'from data0160 where type=1 and oh_degree=6';
  end;
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
  begin
    ShowMessage('没有找到对应仓位，请正确设置仓位！');
    exit;
  end;

  i:=SGrid.RowCount-1;
  iQty:=strtoint(Edit4.Text);//回收数量
  iCurQty:=0;
  DM.CDS160.First;
  while not DM.CDS160.Eof do
  begin
    if iCurQty+DM.CDS160.Fieldbyname('Quan_valid').AsInteger<=iQty then
       SGrid.Cells[5,i]:=DM.CDS160.Fieldbyname('Quan_valid').AsString        //'回仓数量';
    else
      SGrid.Cells[5,i]:=inttostr(iQty-iCurQty);

    iCurQty:=iCurQty+DM.CDS160.Fieldbyname('Quan_valid').AsInteger;
    SGrid.Cells[0,i]:=DM.tmp.Fieldbyname('location_code').AsString;//'位置代码';
    SGrid.Cells[1,i]:=DM.tmp.Fieldbyname('location_name').AsString;//'位置名称';
    SGrid.Cells[2,i]:=DM.CDS160.Fieldbyname('INV_PART_NUMBER').AsString;       //'钻嘴编码';
    SGrid.Cells[3,i]:=DM.CDS160.Fieldbyname('INV_part_description').AsString; ;  //'钻嘴名称';

    SGrid.Cells[4,i]:=DM.tmp.Fieldbyname('oh_degree').AsString; //'研磨次数';
    SGrid.Cells[6,i]:=DM.ADO219REMARK.Value;  //'备注';
    SGrid.Cells[7,i]:=DM.CDS160.Fieldbyname('rkey17').AsString;  //'rkey17';
    SGrid.Cells[8,i]:=DM.tmp.Fieldbyname('rkey').AsString;          //'rkey160';
    SGrid.Cells[9,i]:=DM.CDS160.Fieldbyname('rkey220').AsString;  //'rkey220';
    SGrid.Cells[10,i]:=DM.CDS160.Fieldbyname('supplier_ptr').AsString;//'rkeysupplier';
    SGrid.Cells[11,i]:=IntToStr(Abs(Strtoint(SGrid.Cells[5,i])-DM.CDS160.Fieldbyname('Quan_valid').AsInteger));//'rkeysupplier';
    SGrid.RowCount:=SGrid.RowCount+1;
    inc(i);
    DM.CDS160.Delete;
    if  (iCurQty>=iQty) then break;
  end;
  DM.cds160a.First;
  while not DM.cds160a.Eof do
  begin
    for i :=1  to SGrid.RowCount-2 do
    begin
      if (DM.cds160a.FieldByName('rkey220').AsString=SGrid.Cells[9,i]) then
      begin
        DM.cds160a.Edit;
        DM.cds160a.FieldByName('quan_valid').AsInteger:=Strtoint(SGrid.Cells[11,i]);
        DM.cds160a.Post;
      end;
    end;
    DM.cds160a.Next;
  end;
  iSum:=0;
  for i:=1 to SGrid.RowCount-2 do
  begin
   iSum:=iSum+StrToInt(SGrid.Cells[5,i]);
  end;
  Label12.Caption:=IntToStr(iSum);
end;

procedure TFrm_ZZrecv.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then begin key:=#0;abort;end;
end;

end.
