unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, DB, ADODB,ConstVar, Buttons;

type
  TFrmMain = class(TForm)
    btn_QryProdName: TButton;
    ds_Main: TDataSource;
    qry_main: TADOQuery;
    pnl1: TPanel;
    pnl3: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edt_ProdID: TEdit;
    edt_ProdName: TEdit;
    edt_Desc: TEdit;
    edt_Fac: TEdit;
    edt_WH: TEdit;
    edt_ventorID: TEdit;
    edt_MGroup: TEdit;
    edt_MType: TEdit;
    btn_Qry: TButton;
    btn_QryProdID: TButton;
    btn_QryDesc: TButton;
    btn_QryFac: TButton;
    btn_QryWH: TButton;
    btn_QryVentorID: TButton;
    btn_QryMGroup: TButton;
    btn_QryMType: TButton;
    rg_IE: TRadioGroup;
    btnExcel: TBitBtn;
    pnl2: TPanel;
    dbgrdh1: TDBGridEh;
    btn1: TButton;
    rg_QM: TRadioGroup;
    procedure btn_QryClick(Sender: TObject);
    procedure btn_QryProdIDClick(Sender: TObject);
    procedure btn_QryProdNameClick(Sender: TObject);
    procedure btn_QryDescClick(Sender: TObject);
    procedure btn_QryFacClick(Sender: TObject);
    procedure btn_QryWHClick(Sender: TObject);
    procedure btn_QryVentorIDClick(Sender: TObject);
    procedure btn_QryMGroupClick(Sender: TObject);
    procedure btn_QryMTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure dbgrdh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
          uses UDM,common,Pick_Item_Single;
{$R *.dfm}

procedure TFrmMain.btn_QryClick(Sender: TObject);
var
 ssql,ProdID,ProdName,Desc,Fac,WH,VentorID,MGroup,MType:string;
  DType,QType:string;
  i : integer;
begin
      // Trim(Self.edt_ProdID.Text)<>''

   ProdID:=Trim(self.edt_ProdID.Text);
   ProdName:= Trim(self.edt_ProdName.Text);
   Desc:= Trim(self.edt_Desc.Text);
  Fac:= Trim(self.edt_Fac.Text);
  WH:= Trim(self.edt_WH.Text);
  VentorID:= Trim(self.edt_ventorID.Text);
  MGroup:= Trim(self.edt_MGroup.Text);
  MType:= Trim(self.edt_MType.Text);

     if  rg_QM.ItemIndex=0  then
     QType:='0'
     else
     Qtype:='1';

     if  rg_IE.ItemIndex=0  then
     DType:='0'
     else
     Dtype:='1';
     Screen.Cursor:=crHourGlass;
  try
  ssql:='exec QryProdDetail '''+ProdID+''','''+ProdName+''','''+Desc+''','''+Fac+''','''+WH+''','''+VentorID+''','''+MGroup+''','''+MType+''','+DType+' ' ;   //,'+QType+'
 //showmessage(ssql);
  with qry_main do
  begin
   close;
   sql.Clear;
   sql.Add(ssql);
   open;
   Screen.Cursor:=crDefault;
  end;

    dbgrdh1.Columns[0].Width:=70;
    dbgrdh1.Columns[1].Width:=130;
    dbgrdh1.Columns[2].Width:=250;
    dbgrdh1.Columns[3].Width:=30;
    dbgrdh1.Columns[4].Width:=55;
    dbgrdh1.Columns[5].Width:=55;
    dbgrdh1.Columns[6].Width:=55;
    dbgrdh1.Columns[7].Width:=55;
    dbgrdh1.Columns[8].Width:=55;


    //

   for i:=9 to dbgrdh1.Columns.Count-1 do
    dbgrdh1.Columns[i].Width:=90;





  except on e: exception do
  begin
   ShowMessage('错误：'+e.Message);
   exit;
  end;

  end;

end;

procedure TFrmMain.btn_QryProdIDClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin                                                //manufacturer_name
     frmpick_item_single:=Tfrmpick_item_single.Create(application);
       InputVar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_PART_DESCRIPTION/规格/400,manufacturer_name/制造商名称/100';
      InputVar.Sqlstr := ' select  INV_PART_NUMBER,INV_PART_DESCRIPTION,manufacturer_name  from data0017';
      inputvar.KeyField:='INV_PART_NUMBER';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_ProdID.Text := frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER'];


end;

procedure TFrmMain.btn_QryProdNameClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin                                                //manufacturer_name
     frmpick_item_single:=Tfrmpick_item_single.Create(application);
       InputVar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_NAME/材料名称/200,INV_PART_DESCRIPTION/规格/400,manufacturer_name/制造商名称/100';
      InputVar.Sqlstr := ' select  INV_PART_NUMBER,INV_NAME,INV_PART_DESCRIPTION,manufacturer_name  from data0017';
      inputvar.KeyField:='INV_PART_NUMBER';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_ProdName.Text := frmPick_Item_Single.adsPick.FieldValues['INV_NAME'];
end;

procedure TFrmMain.btn_QryDescClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin                                                //manufacturer_name
     frmpick_item_single:=Tfrmpick_item_single.Create(application);
       InputVar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_NAME/材料名称/200,INV_PART_DESCRIPTION/规格/400,manufacturer_name/制造商名称/100';
      InputVar.Sqlstr := ' select  INV_PART_NUMBER,INV_NAME,INV_PART_DESCRIPTION,manufacturer_name  from data0017';
      inputvar.KeyField:='INV_PART_NUMBER';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_Desc.Text := frmPick_Item_Single.adsPick.FieldValues['INV_PART_DESCRIPTION'];

end;

procedure TFrmMain.btn_QryFacClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin                                                //manufacturer_name
     frmpick_item_single:=Tfrmpick_item_single.Create(application);
       InputVar.Fields := 'WAREHOUSE_CODE/编码/100,WAREHOUSE_NAME/名称/200,ABBR_NAME/简称/100';
      InputVar.Sqlstr := ' select  WAREHOUSE_CODE,WAREHOUSE_NAME  from DAta0015';
      inputvar.KeyField:='WAREHOUSE_CODE';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_Fac.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];

end;

procedure TFrmMain.btn_QryWHClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin                                                //manufacturer_name
     frmpick_item_single:=Tfrmpick_item_single.Create(application);
       InputVar.Fields := 'CODE/编码/100,LOCATION/名称/200';
      InputVar.Sqlstr := ' select  CODE,LOCATION  from DAta0016';
      inputvar.KeyField:='CODE';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_WH.Text := frmPick_Item_Single.adsPick.FieldValues['CODE'];
end;

procedure TFrmMain.btn_QryVentorIDClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin                                                //manufacturer_name
     frmpick_item_single:=Tfrmpick_item_single.Create(application);
       InputVar.Fields := 'CODE/编码/100,SUPPLIER_NAME/名称/200';
      InputVar.Sqlstr := ' select  CODE,SUPPLIER_NAME  from Data0023';
      inputvar.KeyField:='CODE';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_ventorID.Text := frmPick_Item_Single.adsPick.FieldValues['CODE'];


//SUPPLIER_NAME
end;

procedure TFrmMain.btn_QryMGroupClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin                                                //manufacturer_name
     frmpick_item_single:=Tfrmpick_item_single.Create(application);
       InputVar.Fields := 'inv_group_name/组别名称/100,inv_group_desc/描述/200';
      InputVar.Sqlstr := ' select  inv_group_name,inv_group_desc  from Data0019';
      inputvar.KeyField:='inv_group_name';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_MGroup.Text := frmPick_Item_Single.adsPick.FieldValues['inv_group_name'];
end;

procedure TFrmMain.btn_QryMTypeClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin                                                //manufacturer_name
     frmpick_item_single:=Tfrmpick_item_single.Create(application);
       InputVar.Fields := 'GROUP_NAME/类别名称/100,GROUP_DESC/描述/200';
      InputVar.Sqlstr := ' select  GROUP_NAME,GROUP_DESC  from Data0496';
      inputvar.KeyField:='GROUP_NAME';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_MType.Text := frmPick_Item_Single.adsPick.FieldValues['GROUP_NAME'];
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
 
vprev:='4';

  if not App_init_2(DM.con1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

   self.Caption:=application.Title;
   
end;

procedure TFrmMain.btnExcelClick(Sender: TObject);
begin
 if   qry_main.IsEmpty  then exit;
      Export_dbGridEH_to_Excel(dbgrdh1,'库存材料有效期明细');
end;

procedure TFrmMain.dbgrdh1TitleClick(Column: TColumnEh);
begin
if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_Main.Sort:=Column.FieldName;
    //column.Title.Color:=clred;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_Main.Sort:= Column.FieldName + ' DESC';
    // column.Title.Color:=clred;
  end;



end;

procedure TFrmMain.dbgrdh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  If qry_main.FieldByName('状态').Value = '超期'  then
  Begin
    dbgrdh1.Canvas.Font.Color := clBlue;
    dbgrdh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End
  else If qry_main.FieldByName('状态').Value = '异常'  then
  Begin
    dbgrdh1.Canvas.Font.Color := clred;
    dbgrdh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End
end;

end.
