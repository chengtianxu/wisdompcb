unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB,
  ADODB, Menus;

type
  TFrmMain = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    image1: TImage;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Label1: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Label16: TLabel;
    ADODate: TADOQuery;
    Label8: TLabel;
    Edit5: TEdit;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    Label6: TLabel;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label12: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Label15: TLabel;
    Edit12: TEdit;
    StringGrid1: TStringGrid;
    DataSource1: TDataSource;
    empl_ptr: TLabel;
    Label17: TLabel;
    Edit13: TEdit;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    Label7: TLabel;
    Edit14: TEdit;
    MainMenu1: TMainMenu;
    IQC1: TMenuItem;
    IQC2: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Image2: TImage;
    TADOData0468: TADOStoredProc;
    ADOTotStock: TADOStoredProc;
    tmpADO2: TADOStoredProc;
    ADOData0457: TADOStoredProc;
    ADOData0004: TADOStoredProc;
    ADOData0458: TADOStoredProc;
    ADOStockDetail: TADOStoredProc;
    ADOData0207: TADOStoredProc;
    ADOData0095: TADOStoredProc;
    tmpADO0: TADOStoredProc;
    LookupADO2: TADOStoredProc;
    tmpADO1: TADOStoredProc;
    LookUpAdo: TADOStoredProc;
    ADOData0468: TADOStoredProc;
    ADOData0468RKEY: TAutoIncField;
    ADOData0468CUT_NO: TStringField;
    ADOData0468SO_NO: TStringField;
    ADOData0468FLOW_NO: TSmallintField;
    ADOData0468STEP: TSmallintField;
    ADOData0468DEPT_PTR: TIntegerField;
    ADOData0468INVENT_PTR: TIntegerField;
    ADOData0468QUAN_BOM: TFloatField;
    ADOData0468QUAN_ISSUED: TFloatField;
    ADOData0468STATUS: TSmallintField;
    ADOData0468SCH_COMPL_DATE: TDateTimeField;
    ADOData0468ISSUED_QTY: TFloatField;
    ADOData0468MANU_PART_NUMBER: TStringField;
    tmpADO3: TADOStoredProc;
    ADO0022: TADOStoredProc;
    ADOStockDetail2: TADOStoredProc;
    SpeedButton1: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Edit15: TEdit;
    BitBtn9: TBitBtn;
    ADOStockDetailrkey: TAutoIncField;
    ADOStockDetailinventory_ptr: TIntegerField;
    ADOStockDetailwhouse_ptr: TIntegerField;
    ADOStockDetaillocation_ptr: TIntegerField;
    ADOStockDetailbarcode_id: TStringField;
    ADOStockDetailquan_on_hand: TBCDField;
    ADOStockDetailexpire_date: TDateTimeField;
    ADOStockDetailcode: TStringField;
    ADOStockDetailunit_price: TFloatField;
    ADOStockDetailref_number: TStringField;
    ADOStockDetailtdate: TDateTimeField;
    ADOStockDetailpo_number: TStringField;
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure BitBtn5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N7Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit5Enter(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit14Exit(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure BitBtn9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure Savedata(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses Prod_Resource, mo_search,inv_serach, warehouse_search,Report5,
  MATLStkDetail,Assigqty,RetnMATL,RetnMATLAssign, AssigQty2,Employee_search,
  MAINMenu, Prod_Resource0;

{$R *.dfm}

procedure TFrmMain.Edit1Exit(Sender: TObject);
begin
   if FrmMain.ActiveControl =bitbtn1 then exit;
   if FrmMain.ActiveControl =bitbtn2 then exit;
   FrmProdResource.edit1.Text := edit1.Text;
   IF not FrmProdResource.Adoquery1.Eof then
   Begin
     edit1.text:=FrmProdResource.AdoQuery1.fieldbyname('dept_code').asstring;
     label1.Caption :=FrmProdResource.AdoQuery1.fieldbyname('dept_name').asstring;
     Edit15.Text :=edit1.Text;
     edit4.SetFocus ;
   End else
   begin
    messagedlg('工序代号无效！',mtinformation,[mbok],0);
    edit1.SetFocus ;
    edit1.SelectAll ;
   end;
end;

procedure TFrmMain.BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FrmProdResource.edit1.Text := edit1.Text;
   IF FrmProdResource.ShowModal=mrok then
   Begin
     Edit15.Text :=edit1.Text;
     edit1.text:=FrmProdResource.AdoQuery1.fieldbyname('dept_code').asstring;
     label1.Caption :=FrmProdResource.AdoQuery1.fieldbyname('dept_name').asstring;
     edit4.SetFocus ;
   End;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.N1Click(Sender: TObject);
begin
  DataSource1.DataSet := ADOStockDetail;
  Application.CreateForm(TFrmwipStkDetail, FrmwipStkDetail);
  if FrmwipStkDetail.showmodal=mrOk then
  begin
    Application.CreateForm(TFrmAssigQty, FrmAssigQty);
    FrmAssigQty.Edit1.Text :=edit5.Text ;
    FrmAssigQty.Edit2.Text :=floattostr(strtofloat(Stringgrid1.Cells[6,stringgrid1.Row])
                        -strtofloat(Stringgrid1.Cells[7,stringgrid1.Row])
                        -strtofloat(Stringgrid1.Cells[8,stringgrid1.Row]));
    FrmAssigQty.Edit3.Text :=Adostockdetail.fieldbyname('quan_on_hand').asstring;
    if FrmAssigQty.showmodal=mrok then
    begin
        Mainform.Adoconnection1.BeginTrans ;
      try
        AdoStockDetail.Edit ;
        AdoStockDetail.FieldByName('quan_on_hand').AsFloat :=AdoStockDetail.FieldByName('quan_on_hand').AsFloat
                                                            -strtofloat(FrmAssigqty.Edit4.text);
        AdoStockDetail.post;
        Adodate.close;
        Adodate.open;
        Adodata0468.MoveBy(stringgrid1.row-Adodata0468.RecNo);

        if not Adodata0095.Locate('srce_ptr;reference_number',
            vararrayof([AdoStockDetail.FieldByName('rkey').Asinteger,AdoData0468.FieldByName('cut_no').Asstring]),[]) then
        begin
          Adodata0095.append;
          Adodata0095.FieldByName('tran_tp').asinteger:=12;
          Adodata0095.FieldByName('invt_ptr').asinteger:=AdoStockDetail.FieldByName('inventory_ptr').Asinteger;
          Adodata0095.FieldByName('srce_ptr').asinteger:=AdoStockDetail.FieldByName('rkey').Asinteger;
          Adodata0095.FieldByName('tran_by').asstring:=Mainform.user_ptr.Caption ;
          Adodata0095.FieldByName('rec_by').asstring:=empl_ptr.Caption ;
          Adodata0095.FieldByName('reference_number').asstring:=AdoData0468.FieldByName('cut_no').Asstring;
          Adodata0095.FieldByName('tran_date').asstring:=Adodate.fieldbyname('vdt').AsString;
        end;
        Adodata0095.edit;
        Adodata0095.FieldByName('quantity').asfloat:=Adodata0095.FieldByName('quantity').asfloat+strtofloat(FrmAssigqty.Edit4.text);
        Adodata0095.post;

        if not Adodata0207.Locate('d0022_ptr;d0468_ptr',
            vararrayof([AdoStockDetail.FieldByName('rkey').Asinteger,AdoData0468.FieldByName('rkey').Asinteger]),[]) then
        begin
          Adodata0207.append;
          Adodata0207.FieldByName('GON_PTR').asstring:=Adodata0457.fieldbyname('rkey').asstring;
          Adodata0207.FieldByName('inventory_ptr').asinteger:=AdoStockDetail.FieldByName('inventory_ptr').Asinteger;
          Adodata0207.FieldByName('dept_ptr').asinteger:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
          Adodata0207.FieldByName('Ttype').asinteger:=1;
          Adodata0207.FieldByName('transaction_ptr').asinteger:=AdoData0095.FieldByName('rkey').Asinteger;
          Adodata0207.FieldByName('D0468_ptr').asinteger:=AdoData0468.FieldByName('rkey').Asinteger;
          Adodata0207.FieldByName('D0022_ptr').asinteger:=AdoStockDetail.FieldByName('rkey').Asinteger;
          Adodata0207.FieldByName('tdate').asstring:=Adodate.fieldbyname('vdt').AsString;
          Adodata0207.FieldByName('standard_cost').asstring:=FrminvSearch.ADOQuery1.fieldbyname('std_cost').asstring;
        end;
        Adodata0207.edit;
        Adodata0207.FieldByName('quantity').asfloat:=Adodata0207.FieldByName('quantity').asfloat+strtofloat(FrmAssigqty.Edit4.text);
        Adodata0207.post;

        Adodata0468.edit;
        Adodata0468.fieldbyname('quan_issued').asfloat:=strtofloat(Stringgrid1.Cells[7,stringgrid1.row])
                                                        +strtofloat(Stringgrid1.Cells[8,stringgrid1.row])+strtofloat(FrmAssigqty.Edit4.text);
        Adodata0468.post;

        Mainform.Adoconnection1.CommitTrans ;

        Stringgrid1.Cells[8,stringgrid1.row]:=floattostr(strtofloat(Stringgrid1.Cells[8,stringgrid1.row])+strtofloat(FrmAssigqty.Edit4.text));
        edit6.text:=floattostr(strtofloat(edit6.text)+strtofloat(FrmAssigqty.Edit4.text));
      except
        Mainform.Adoconnection1.RollbackTrans ;
        messagedlg('资料提交不成功，项目已被其它用户使用，需要重新发料',mtinformation,[mbok],0);
        close;
      end;
    end;
    FrmAssigQty.free;
  end;
  FrmwipStkDetail.free;
end;

procedure TFrmMain.Edit5Exit(Sender: TObject);
var i:integer;
begin
   if trim(edit5.Text)='' then exit;
   if FrmMain.ActiveControl =bitbtn1 then exit;
   if FrmMain.ActiveControl =bitbtn5 then exit;
   FrmInvSearch.edit1.Text := edit5.Text;
   IF not FrmInvSearch.Adoquery1.Eof then
   Begin
     edit5.text:=FrmInvSearch.AdoQuery1.fieldbyname('inv_part_number').asstring;
     edit8.text:=FrmInvSearch.AdoQuery1.fieldbyname('unit_code').asstring;
     edit9.Text:=FrmInvSearch.AdoQuery1.fieldbyname('Inv_part_description').asstring;
     with Adodata0458 do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=FrmProdResource0.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     with LookupAdo2 do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=FrmProdResource0.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     with Adodata0468 do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=FrmProdResource0.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     if Adodata0468.RecordCount =0 then
     begin
       messagedlg('该部门没有当前材料项目的配额，不能发料！',mtinformation,[mbok],0);
       exit;
     end;
     with tAdodata0468 do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=FrmProdResource0.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     with ADOTotStock do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=Frmwhouse.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     with ADOStockDetail do
     begin
        close;
        Parameters.ParamByName('@vptr1').value:=Frmwhouse.AdoQuery1.fieldbyname('rkey').asinteger;
        Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
        prepared;
        open;
     end;

     i:=1;
     with Adodata0468 do
     while not eof do
     begin
       stringgrid1.RowCount :=i+1;
       stringgrid1.rows[i].Text:='';
       stringgrid1.Cells[0,i]:=Fieldbyname('cut_no').asstring;
       stringgrid1.Cells[1,i]:=Fieldbyname('manu_part_number').asstring;
       stringgrid1.Cells[2,i]:=Fieldbyname('sch_compl_date').asstring;
       stringgrid1.Cells[3,i]:=Fieldbyname('so_no').asstring;
       stringgrid1.Cells[4,i]:=Fieldbyname('issued_qty').asstring;
       stringgrid1.Cells[5,i]:=Fieldbyname('step').asstring;
       stringgrid1.Cells[6,i]:=format('%.3f',[Fieldbyname('quan_bom').asfloat]);
       stringgrid1.Cells[7,i]:=Fieldbyname('quan_issued').asstring;
       IF stringgrid1.Cells[6,i]='' then stringgrid1.Cells[6,i]:='0';
       IF stringgrid1.Cells[7,i]='' then stringgrid1.Cells[7,i]:='0';
       stringgrid1.Cells[8,i]:='0';
       i:=i+1;
       next;
     end;

     if Adodata0458.RecordCount >0 then
     begin
       Edit10.Text :=Adodata0458.fieldbyname('bal_qty').asstring;
       Edit12.Text :=Adodata0458.fieldbyname('bal_qty').asstring;
     end;
     Edit11.Text :=tAdodata0468.fieldbyname('quantity').asstring;

     edit3.Text :=floattostr(Adototstock.fieldbyname('qty').asfloat);
     if Adototstock.fieldbyname('qty').asfloat=0 then
       if messagedlg('该项材料已经没有库存！是否继续？',mtconfirmation,[mbYes,mbNo],0)=mrNo then
     begin
       edit5.SetFocus ;
       exit;
     end;
     stringgrid1.Enabled :=true;
     SpeedButton1.Enabled :=true;
     stringgrid1.Refresh;
     edit1.Enabled :=false;
     edit15.Enabled :=false;
     edit2.Enabled :=false;
     edit4.Enabled :=false;
     edit5.Enabled :=false;
     bitbtn2.Enabled :=false;
     bitbtn9.Enabled :=false;
     bitbtn3.Enabled :=false;
     bitbtn4.Enabled :=false;
     bitbtn5.Enabled :=false;
   End else
   begin
    messagedlg('材料代号无效！',mtinformation,[mbok],0);
    edit5.SetFocus ;
    edit5.SelectAll ;
   end;
end;

procedure TFrmMain.BitBtn5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:integer;
begin
   if trim(edit4.Text)='' then
   begin
     messagedlg('请输入雇员代号！',mtinformation,[mbok],0);
     edit4.SetFocus ;
   end;
   if trim(edit1.Text)='' then
   begin
     messagedlg('请输入厂房代号！',mtinformation,[mbok],0);
     edit1.SetFocus ;
   end;
   FrmInvSearch.edit1.Text := edit5.Text;
   IF FrmInvSearch.ShowModal=mrok then
   Begin
     edit5.text:=FrmInvSearch.AdoQuery1.fieldbyname('inv_part_number').asstring;
     edit8.text:=FrmInvSearch.AdoQuery1.fieldbyname('unit_code').asstring;
     edit9.Text:=FrmInvSearch.AdoQuery1.fieldbyname('Inv_part_description').asstring;
     with Adodata0458 do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=FrmProdResource0.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     with LookupAdo2 do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=FrmProdResource0.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     with Adodata0468 do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=FrmProdResource0.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     if Adodata0468.RecordCount =0 then
     begin
       messagedlg('该部门没有当前材料项目的配额，不能发料！',mtinformation,[mbok],0);
       exit;
     end;
     with tAdodata0468 do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=FrmProdResource0.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     with ADOTotStock do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=Frmwhouse.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       open;
     end;
     with ADOStockDetail do
     begin
       close;
       Parameters.ParamByName('@vptr1').value:=Frmwhouse.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       prepared;
       open;
     end;
     i:=1;
     with Adodata0468 do
     while not eof do
     begin
       stringgrid1.RowCount :=i+1;
       stringgrid1.rows[i].Text:='';
       stringgrid1.Cells[0,i]:=Fieldbyname('cut_no').asstring;
       stringgrid1.Cells[1,i]:=Fieldbyname('manu_part_number').asstring;
       stringgrid1.Cells[2,i]:=Fieldbyname('sch_compl_date').asstring;
       stringgrid1.Cells[3,i]:=Fieldbyname('so_no').asstring;
       stringgrid1.Cells[4,i]:=Fieldbyname('issued_qty').asstring;
       stringgrid1.Cells[5,i]:=Fieldbyname('step').asstring;
       stringgrid1.Cells[6,i]:=format('%.3f',[Fieldbyname('quan_bom').asfloat]);
       stringgrid1.Cells[7,i]:=Fieldbyname('quan_issued').asstring;
       stringgrid1.Cells[8,i]:='0';
       i:=i+1;
       next;
     end;

     if Adodata0458.RecordCount >0 then
     begin
       Edit10.Text :=Adodata0458.fieldbyname('bal_qty').asstring;
       Edit12.Text :=Adodata0458.fieldbyname('bal_qty').asstring;
     end;
     Edit11.Text :=tAdodata0468.fieldbyname('quantity').asstring;

     edit3.Text :=floattostr(Adototstock.fieldbyname('qty').asfloat);
     if Adototstock.fieldbyname('qty').asfloat=0 then
       if messagedlg('该项材料已经没有库存！是否继续？',mtconfirmation,[mbYes,mbNo],0)=mrNo then
     begin
       edit5.SetFocus ;
       exit;
     end;
     stringgrid1.Enabled :=true;
     SpeedButton1.Enabled :=true;
     stringgrid1.Refresh;
     edit1.Enabled :=false;
     edit15.Enabled :=false;
     edit2.Enabled :=false;
     edit4.Enabled :=false;
     edit5.Enabled :=false;
     bitbtn2.Enabled :=false;
     bitbtn9.Enabled :=false;
     bitbtn3.Enabled :=false;
     bitbtn4.Enabled :=false;
     bitbtn5.Enabled :=false;
   End;
end;

procedure TFrmMain.Edit2Exit(Sender: TObject);
begin
   if FrmMain.ActiveControl =bitbtn1 then exit;
   if FrmMain.ActiveControl =bitbtn4 then exit;
   FrmWhouse.edit1.Text := edit2.Text;
   IF not FrmWhouse.Adoquery1.Eof then
   Begin
     edit2.text:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_code').asstring;
     label3.Caption:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_name').asstring;
     edit14.SetFocus ;
   End else
   begin
    messagedlg('厂房代号无效！',mtinformation,[mbok],0);
    edit2.SetFocus ;
    edit2.SelectAll ;
   end;
end;

procedure TFrmMain.BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FrmWhouse.edit1.Text := edit2.Text;
   IF FrmWhouse.ShowModal=mrok then
   Begin
     edit2.text:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_code').asstring;
     label3.Caption:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_name').asstring;
     edit14.SetFocus ;
   End;
end;

procedure TFrmMain.Edit3Change(Sender: TObject);
begin
  edit7.Text :=floattostr(strtofloat(edit3.Text)-strtofloat(edit6.Text));
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TFrmProdResource, FrmProdResource);
  Application.CreateForm(TFrmProdResource0, FrmProdResource0);
  Application.CreateForm(TFrmWhouse, FrmWhouse);
  Application.CreateForm(TFrmInvSearch, FrmInvSearch);
  Application.CreateForm(TFrmEmployeeSearch, FrmEmployeeSearch);
  if Adodata0207.Active =false then Adodata0207.Open ;
  if Adodata0095.Active =false then Adodata0095.Open ;
  with stringgrid1 do
  begin
    cells[0,0]:='配料单号';
    cells[1,0]:='生产部件';
    cells[2,0]:='生产交货期';
    cells[3,0]:='S/O编号';
    cells[4,0]:='投产数量';
    cells[5,0]:='阶段';
    cells[6,0]:='配额数量';
    cells[7,0]:='已发数量';
    cells[8,0]:='发放数量';
    cells[9,0]:='关闭';
  end;
end;

procedure TFrmMain.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (acol=9) and (arow>0) then
  IF Adodata0468.active=true THEN
  begin
    AdoData0468.moveby(aRow-Adodata0468.recno);
    IF Adodata0468.FieldValues['status']=1 THEN
      Stringgrid1.Canvas.Draw(rect.Left+12,rect.Top+2,image1.Picture.Graphic)
    else
      Stringgrid1.Canvas.Draw(rect.Left+12,rect.Top+2,image2.Picture.Graphic);
  end;
  If arow>0 then
  If (acol>=4) and (acol<=8)then
  begin
      Stringgrid1.Canvas.TextRect(rect,rect.right-Stringgrid1.Canvas.TextWidth(Stringgrid1.Cells[acol,arow])-2,
        rect.Top+2, Stringgrid1.Cells[aCol,aRow]	);
  end;
end;

procedure TFrmMain.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (stringgrid1.CellRect(9,stringgrid1.Row).Left <= x)
   and (stringgrid1.CellRect(9,stringgrid1.Row).right >= x) then
  begin
    AdoData0468.moveby(Stringgrid1.row-Adodata0468.recno);
    Adodata0468.Edit;
    if Adodata0468.FieldByName('status').asinteger=0 then
    begin
      Adodata0468.FieldByName('status').asinteger:=1;
      edit12.Text :=floattostr(strtofloat(edit12.Text)
                    +strtofloat(stringgrid1.Cells[7,stringgrid1.row])
                    +strtofloat(stringgrid1.Cells[8,stringgrid1.row])
                    -strtofloat(stringgrid1.Cells[6,stringgrid1.row]));
    end else
    begin
      Adodata0468.FieldByName('status').asinteger:=0;
      edit12.Text :=floattostr(strtofloat(edit12.Text)
                    -strtofloat(stringgrid1.Cells[7,stringgrid1.row])
                    -strtofloat(stringgrid1.Cells[8,stringgrid1.row])
                    +strtofloat(stringgrid1.Cells[6,stringgrid1.row]));
    end;
    Adodata0468.post;

    if Adodata0458.RecordCount=0 then
    with Adodata0458 do
    begin
      Append;
      Fieldbyname('dept_ptr').AsInteger:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
      Fieldbyname('invent_ptr').AsInteger:=FrminvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
    end;
    Adodata0458.edit;
    Adodata0458.fieldbyname('bal_qty').asstring:=edit12.Text;
    Adodata0458.fieldbyname('last_date').asstring:=datetostr(Adodate.fieldbyname('vdt').asdatetime);
    Adodata0458.post;
  end;
  Stringgrid1.Refresh;
end;

procedure TFrmMain.N7Click(Sender: TObject);
VAR i:integer;
begin
  AdoData0468.moveby(Stringgrid1.row-Adodata0468.recno);
  Adodata0207.Filter :='d0468_ptr='+Adodata0468.fieldbyname('rkey').asstring;
  Application.CreateForm(TFrmRetnMATL, FrmRetnMATL);
  Adodata0207.First ;
  i:=1;
  with Adodata0207 do
  while not eof do
    begin
      with LookupADO do
      begin
        close;
        Parameters.ParamByName('@vptr').Value :=Adodata0207.fieldbyname('d0022_ptr').AsInteger ;
        open;
      end;
      FrmRetnMATL.stringgrid1.RowCount:=i+1;
      FrmRetnMATL.stringgrid1.Cells[0,i]:=LookupAdo.fieldbyname('inv_part_number').asstring;
      FrmRetnMATL.stringgrid1.Cells[1,i]:=LookupAdo.fieldbyname('warehouse_code').asstring;
      FrmRetnMATL.stringgrid1.Cells[2,i]:=LookupAdo.fieldbyname('code').asstring;
      FrmRetnMATL.stringgrid1.Cells[3,i]:=LookupAdo.fieldbyname('barcode_id').asstring;
      FrmRetnMATL.stringgrid1.Cells[4,i]:=Adodata0207.fieldbyname('quantity').asstring;
      FrmRetnMATL.stringgrid1.Cells[5,i]:=Adodata0207.fieldbyname('d0468_alt_rate').asstring;
      i:=1+i;
      next;
    end;
  if FrmRetnMATL.showmodal=mrok then
  begin
    AdoData0207.moveby(FrmRetnMATL.stringgrid1.row-Adodata0207.recno);
    Application.CreateForm(TFrmRetnAssigning, FrmRetnAssigning);
    FrmRetnAssigning.Edit1.Text:=FrmRetnMATL.stringgrid1.Cells[0,FrmRetnMATL.stringgrid1.row];
    FrmRetnAssigning.Edit2.Text:=Adodata0207.fieldbyname('quantity').asstring;
    if FrmRetnAssigning.showmodal=mrOk then
    begin
        Mainform.Adoconnection1.BeginTrans ;
        try
          ADOStockDetail.Close;
          with ADO0022 do
          begin
            close;
            parameters.ParamByName('@vptr').Value :=Adodata0207.fieldbyname('d0022_ptr').asinteger;
            open;
            Edit ;
            FieldByName('quan_on_hand').AsFloat :=FieldByName('quan_on_hand').AsFloat
                                                  +strtofloat(trim(FrmRetnAssigning.MaskEdit1.Text));
            post;
          end;

          Adodate.close;
          Adodate.open;
          Adodata0468.MoveBy(stringgrid1.row-Adodata0468.RecNo);

          Adodata0095.Locate('srce_ptr;reference_number',
            vararrayof([Adodata0207.fieldbyname('d0022_ptr').asinteger,AdoData0468.FieldByName('cut_no').Asstring]),[]);
          Adodata0095.edit;
          Adodata0095.FieldByName('quantity').asfloat:=Adodata0095.FieldByName('quantity').asfloat
            -strtofloat(FrmRetnAssigning.Maskedit1.Text);

          if Adodata0095.FieldByName('quantity').asfloat=0 then Adodata0095.Delete else
            Adodata0095.post;

          Adodata0207.Locate('d0022_ptr;d0468_ptr',
            vararrayof([Adodata0207.fieldbyname('d0022_ptr').asinteger,AdoData0468.FieldByName('rkey').Asinteger]),[]);

          Adodata0468.edit;
          if  Adodata0207.FieldByName('d0468_alt_rate').Asfloat>0 then
            Adodata0468.fieldbyname('quan_issued').asfloat:=Adodata0468.fieldbyname('quan_issued').asfloat
                                                          -strtofloat(FrmRetnAssigning.Maskedit1.Text)*AdoData0207.FieldByName('d0468_alt_rate').Asfloat
          else
            Adodata0468.fieldbyname('quan_issued').asfloat:=Adodata0468.fieldbyname('quan_issued').asfloat
                                                          -strtofloat(FrmRetnAssigning.Maskedit1.Text);
          Adodata0468.post;

          if  AdoData0207.FieldByName('d0468_alt_rate').Asfloat>0 then
            Stringgrid1.Cells[8,stringgrid1.row]:=floattostr(strtofloat(Stringgrid1.Cells[8,stringgrid1.row])
                                                          -strtofloat(FrmRetnAssigning.Maskedit1.Text)*AdoData0207.FieldByName('d0468_alt_rate').Asfloat)
          else
          begin
            Stringgrid1.Cells[8,stringgrid1.row]:=floattostr(strtofloat(Stringgrid1.Cells[8,stringgrid1.row])
                                                          -strtofloat(FrmRetnAssigning.Maskedit1.Text));
            edit6.text:=floattostr(strtofloat(edit6.text)+strtofloat(FrmRetnAssigning.Maskedit1.Text));
          end;

          Adodata0207.edit;
          Adodata0207.FieldByName('quantity').asfloat:=Adodata0207.FieldByName('quantity').asfloat
                      -strtofloat(FrmRetnAssigning.Maskedit1.Text);
          if Adodata0207.FieldByName('quantity').asfloat=0 then Adodata0207.Delete else
            Adodata0207.post;

          Mainform.Adoconnection1.CommitTrans ;
        except
          Mainform.Adoconnection1.RollbackTrans ;
          messagedlg('资料提交不成功，项目已被其它用户使用，需要重新发料',mtinformation,[mbok],0);
          close;
        end;
    end;
    FrmRetnAssigning.free;
  end;
  FrmRetnMATL.free;
  Adodata0207.Filter :='';
  ADOStockDetail.Close; //因为记录可能在此有修改，所以需要重新读取数据
  ADOStockDetail.open;
end;

procedure TFrmMain.N5Click(Sender: TObject);
var i:integer;
begin
  i:=FrmInvSearch.ADOQuery1.RecNo ;
  IF FrmInvSearch.ShowModal=mrok then
  Begin
    with ADOStockDetail2 do
    begin
       close;
       Parameters.ParamByName('@vptr1').value:=Frmwhouse.AdoQuery1.fieldbyname('rkey').asinteger;
       Parameters.ParamByName('@vptr2').value:=FrmInvSearch.AdoQuery1.fieldbyname('rkey').asinteger;
       prepared;
       open;
    end;
    if AdostockDetail2.IsEmpty then
    begin
      messagedlg('该项材料没有库存！',mtinformation,[mbok],0);
      exit;
    end;
    DataSource1.DataSet := ADOStockDetail2;
    Application.CreateForm(TFrmwipStkDetail, FrmwipStkDetail);
    if FrmwipStkDetail.showmodal=mrOk then
    begin
      Application.CreateForm(TFrmAssigQty2, FrmAssigQty2);
      FrmAssigQty2.Edit1.Text :=FrmInvSearch.AdoQuery1.fieldbyname('INV_part_number').asstring;
      FrmAssigQty2.Edit2.Text :=floattostr(strtofloat(Stringgrid1.Cells[6,stringgrid1.Row])
                        -strtofloat(Stringgrid1.Cells[7,stringgrid1.Row])
                        -strtofloat(Stringgrid1.Cells[8,stringgrid1.Row]));
      FrmAssigQty2.Edit3.Text :=ADOStockDetail2.fieldbyname('quan_on_hand').asstring;
      Adodata0468.MoveBy(stringgrid1.row-Adodata0468.RecNo);
      if Adodata0207.Locate('d0022_ptr;d0468_ptr',
          vararrayof([ADOStockDetail2.FieldByName('rkey').Asinteger,AdoData0468.FieldByName('rkey').Asinteger]),[]) then
      begin
        FrmAssigQty2.Edit5.Text :=Adodata0207.FieldByName('D0468_alt_rate').asstring;
        FrmAssigQty2.Edit5.Enabled :=false;
      end;
      if FrmAssigQty2.showmodal=mrok then
      begin
        Mainform.Adoconnection1.BeginTrans ;
        try
          ADOStockDetail2.Edit ;
          ADOStockDetail2.FieldByName('quan_on_hand').AsFloat :=ADOStockDetail2.FieldByName('quan_on_hand').AsFloat
                                                              -strtofloat(FrmAssigqty2.Edit4.text);
          ADOStockDetail2.post;

          Adodate.close;
          Adodate.open;
          Adodata0468.MoveBy(stringgrid1.row-Adodata0468.RecNo);

          if not Adodata0095.Locate('srce_ptr;reference_number',
              vararrayof([ADOStockDetail2.FieldByName('rkey').Asinteger,AdoData0468.FieldByName('cut_no').Asstring]),[]) then
          begin
            Adodata0095.append;
            Adodata0095.FieldByName('tran_tp').asinteger:=12;
            Adodata0095.FieldByName('invt_ptr').asinteger:=ADOStockDetail2.FieldByName('inventory_ptr').Asinteger;
            Adodata0095.FieldByName('srce_ptr').asinteger:=ADOStockDetail2.FieldByName('rkey').Asinteger;
            Adodata0095.FieldByName('tran_by').asstring:=Mainform.user_ptr.Caption ;
            Adodata0095.FieldByName('rec_by').asstring:=empl_ptr.Caption ;
            Adodata0095.FieldByName('reference_number').asstring:=AdoData0468.FieldByName('cut_no').Asstring;
            Adodata0095.FieldByName('tran_date').asstring:=Adodate.fieldbyname('vdt').AsString;
          end;
          Adodata0095.edit;
          Adodata0095.FieldByName('quantity').asfloat:=Adodata0095.FieldByName('quantity').asfloat
                                                          +strtofloat(FrmAssigqty2.Edit4.text);
          Adodata0095.post;

          if not Adodata0207.Locate('d0022_ptr;d0468_ptr',
            vararrayof([ADOStockDetail2.FieldByName('rkey').Asinteger,AdoData0468.FieldByName('rkey').Asinteger]),[]) then
          begin
            Adodata0207.append;
            Adodata0207.FieldByName('GON_PTR').asstring:=Adodata0457.fieldbyname('rkey').asstring;
            Adodata0207.FieldByName('inventory_ptr').asinteger:=ADOStockDetail2.FieldByName('inventory_ptr').Asinteger;
            Adodata0207.FieldByName('dept_ptr').asinteger:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
            Adodata0207.FieldByName('Ttype').asinteger:=1;
            Adodata0207.FieldByName('transaction_ptr').asinteger:=AdoData0095.FieldByName('rkey').Asinteger;
            Adodata0207.FieldByName('D0468_ptr').asinteger:=AdoData0468.FieldByName('rkey').Asinteger;
            Adodata0207.FieldByName('D0468_alt_rate').asstring:=FrmAssigqty2.Edit5.text;
            Adodata0207.FieldByName('D0022_ptr').asinteger:=ADOStockDetail2.FieldByName('rkey').Asinteger;
            Adodata0207.FieldByName('tdate').asstring:=Adodate.fieldbyname('vdt').AsString;
            Adodata0207.FieldByName('standard_cost').asstring:=FrminvSearch.ADOQuery1.fieldbyname('std_cost').asstring;
          end;
          Adodata0207.edit;
          Adodata0207.FieldByName('quantity').asfloat:=Adodata0207.FieldByName('quantity').asfloat
                                                          +strtofloat(FrmAssigqty2.Edit4.text);
          Adodata0207.post;

          Adodata0468.edit;
          Adodata0468.fieldbyname('quan_issued').asfloat:=strtofloat(Stringgrid1.Cells[7,stringgrid1.row])
                                                          +strtofloat(Stringgrid1.Cells[8,stringgrid1.row])
                                                          +strtofloat(FrmAssigqty2.Edit4.text)*strtofloat(FrmAssigqty2.Edit5.text);
          Adodata0468.post;

          Mainform.Adoconnection1.CommitTrans ;

          Stringgrid1.Cells[8,stringgrid1.row]:=floattostr(strtofloat(Stringgrid1.Cells[8,stringgrid1.row])
                                                          +strtofloat(FrmAssigqty2.Edit4.text)*strtofloat(FrmAssigqty2.Edit5.text));
        except
          Mainform.Adoconnection1.RollbackTrans ;
          messagedlg('资料提交不成功，项目已被其它用户使用，需要重新发料',mtinformation,[mbok],0);
          close;
        end;
      end;

      FrmAssigqty2.free;
    end;
    FrmwipStkDetail.free;
    ADOStockDetail2.CLOSE;
  End;
  FrmInvSearch.ADOQuery1.MoveBy(i-FrmInvSearch.ADOQuery1.RecNo);
end;

procedure TFrmMain.Edit4Exit(Sender: TObject);
begin
   if FrmMain.ActiveControl =bitbtn1 then exit;
   if FrmMain.ActiveControl =bitbtn3 then exit;
   if edit4.Text ='' then
   begin
    messagedlg('雇员代号无效！',mtinformation,[mbok],0);
    edit4.SetFocus ;
    exit;
   end;
   FrmEmployeeSearch.edit1.Text := edit4.Text;
   IF not FrmEmployeeSearch.Adoquery1.Eof then
   Begin
     edit4.text:=FrmEmployeeSearch.AdoQuery1.fieldbyname('empl_code').asstring;
     label16.Caption:=FrmEmployeeSearch.AdoQuery1.fieldbyname('employee_name').asstring;
     empl_ptr.Caption:=FrmEmployeeSearch.AdoQuery1.fieldbyname('rkey').asstring;
      with Adodata0457 do
      begin
        edit;
        Fieldbyname('ref_number').asstring:=edit14.text;
        Fieldbyname('recd_by').asstring:=empl_ptr.Caption;
        post;
      end;
   End else
   begin
    messagedlg('雇员代号无效！',mtinformation,[mbok],0);
    edit4.SetFocus ;
    edit4.SelectAll ;
   end;
end;

procedure TFrmMain.BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FrmEmployeeSearch.edit1.Text := edit4.Text;
   if FrmEmployeeSearch.showmodal=mrok then
   Begin
     edit4.text:=FrmEmployeeSearch.AdoQuery1.fieldbyname('empl_code').asstring;
     label16.Caption:=FrmEmployeeSearch.AdoQuery1.fieldbyname('employee_name').asstring;
     empl_ptr.Caption:=FrmEmployeeSearch.AdoQuery1.fieldbyname('rkey').asstring;
      with Adodata0457 do
      begin
        edit;
        Fieldbyname('ref_number').asstring:=edit14.text;
        Fieldbyname('recd_by').asstring:=empl_ptr.Caption;
        post;
      end;
     edit5.SetFocus ;
   end;
end;

procedure TFrmMain.Edit5Enter(Sender: TObject);
begin
  if trim(edit4.Text)='' then
  begin
    messagedlg('请输入雇员代号！',mtinformation,[mbok],0);
    edit4.SetFocus ;
    exit;
  end;
  if trim(edit2.Text)='' then
  begin
    messagedlg('请输入厂房代号！',mtinformation,[mbok],0);
    edit1.SetFocus ;
    exit;
  end;
  if trim(edit1.Text)='' then
  begin
    messagedlg('请输入领料部门！',mtinformation,[mbok],0);
    edit1.SetFocus ;
    exit;
  end;
end;

procedure TFrmMain.BitBtn7Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport5, FrmReport5);
    with FrmReport5.Ado1 do
    begin
      close;
      Parameters.ParamByName('vptr').Value :=Adodata0457.fieldbyname('rkey').asinteger;
      open;
    end;
    FrmReport5.ADOData0493.Open ;
    FrmReport5.ppLabel24.Caption :=edit13.Text ;
    FrmReport5.ppLabel11.Caption:=edit14.Text ;
    FrmReport5.ppLabel23.Caption :=label16.caption;
    FrmReport5.ppLabel10.Caption :=tmpAdo2.fieldbyname('employee_name').AsString;
    FrmReport5.ppReport1.Print;
    FrmReport5.Free ;
end;

procedure TFrmMain.BitBtn8Click(Sender: TObject);
begin
  SpeedButton1.Enabled :=False;
  stringgrid1.Enabled :=false;
  edit5.Enabled :=true;
  bitbtn5.Enabled :=true;
  Edit3.Text :='0';
  Edit5.Text :='';
  Edit6.Text :='0';
  Edit7.Text :='0';
  Edit8.Text :='';
  Edit9.Text :='';
  Edit10.Text :='0';
  Edit11.Text :='0';
  Edit12.Text :='0';
  stringgrid1.RowCount :=2;
  stringgrid1.Rows[1].Text :='';
  edit5.SetFocus ;
end;

procedure TFrmMain.BitBtn6Click(Sender: TObject);
var
  v1,j1:integer;
  vseed,vseed0,vseed1:string;
begin
  if trim(edit13.Text)<>'' then
    savedata(Sender);

  Adodata0004.Close;
  Adodata0004.Open;
  Edit13.text:=Adodata0004.Fieldbyname('seed_value').asstring;
  while true do
  begin
    with tmpAdo3 do
    begin
      close;
      Parameters.ParamByName('@vptr').Value:=trim(Edit13.text);
      open;
    end;
    if tmpAdo3.RecordCount=0
      then break else
      begin
        vseed0:='';
        Vseed1:=Trim(Edit13.text);
        v1:=0;
        for j1:=length(trim(vseed1)) downto 1 do
          begin
          try
            if strtoint(copy(trim(vseed1),j1,1))>0 then;
          except
            v1:=1;
            break;
          end;
        end;
        if v1=0 then j1:=0;
        vseed0:=copy(trim(vseed1),1,j1);
        vseed:=copy(trim(vseed1),j1+1,Length(trim(vseed1))-j1);
        vseed:=copy(trim(inttostr(strtoint(vseed)+10000000000+1)),11-length(trim(vseed))+1,length(trim(vseed)));
        Edit13.text:=vseed0+vseed;
      end;
  end;
  Adodate.Close ;
  Adodate.Open ;
  Adodata0457.Close ;
  Adodata0457.open ;
  Adodata0457.Append ;
  Adodata0457.FieldByName('GON_NUMBER').AsString :=edit13.text;
  Adodata0457.FieldByName('CREATE_BY').AsString :=Mainform.user_ptr.Caption;
  Adodata0457.FieldByName('CREATE_DATE').AsString :=adodate.fieldbyname('vdt').asstring;
  Adodata0457.FieldByName('TTYPE').AsString :='1';
  Adodata0457.Post;
  Adodata0207.close ;
  Adodata0207.Open ;
  Adodata0095.close;
  Adodata0095.Open ;

  stringgrid1.Enabled :=false;
  SpeedButton1.Enabled :=False;
  edit1.Enabled :=true;
  edit15.Enabled :=true;
  edit2.Enabled :=true;
  edit4.Enabled :=true;
  edit5.Enabled :=true;
  bitbtn2.Enabled :=true;
  bitbtn9.Enabled :=true;
  bitbtn3.Enabled :=true;
  bitbtn4.Enabled :=true;
  bitbtn5.Enabled :=true;
  bitbtn7.Enabled :=true;
  bitbtn8.Enabled :=true;
  Edit3.Text :='0';
  Edit4.Text :='';
  Edit5.Text :='';
  Edit6.Text :='0';
  Edit7.Text :='0';
  Edit8.Text :='';
  Edit9.Text :='';
  Edit10.Text :='0';
  Edit11.Text :='0';
  Edit12.Text :='0';
  stringgrid1.RowCount :=2;
  stringgrid1.Rows[1].Text :='';
  edit2.SetFocus ;
end;

procedure TFrmMain.Savedata(Sender: TObject);
var
  v1,j1:integer;
  vseed,vseed0,vseed1:string;
begin
    if Adodata0207.RecordCount =0 then
    begin
      Adodata0457.delete;
    end else begin//保存数据处理
      //提交收货单并在出现重复时自动增加1；
      while true do
      begin
        with tmpAdo0 do
        begin
          close;
          Parameters.ParamByName('@vptr').Value:=trim(Adodata0457.Fieldbyname('gon_number').asstring);
          Parameters.ParamByName('@vptr2').Value:=Adodata0457.Fieldbyname('rkey').asinteger;
          open;
        end;
        if tmpAdo0.RecordCount=0
          then break else
          begin
            vseed0:='';
            Vseed1:=Trim(Adodata0457.Fieldbyname('gon_number').asstring);
            v1:=0;
            for j1:=length(trim(vseed1)) downto 1 do
              begin
              try
                if strtoint(copy(trim(vseed1),j1,1))>0 then;
              except
                v1:=1;
                break;
              end;
            end;
            if v1=0 then j1:=0;
            vseed0:=copy(trim(vseed1),1,j1);
            vseed:=copy(trim(vseed1),j1+1,Length(trim(vseed1))-j1);
            vseed:=copy(trim(inttostr(strtoint(vseed)+10000000000+1)),11-length(trim(vseed))+1,length(trim(vseed)));
            Adodata0457.Edit;
            Adodata0457.Fieldbyname('gon_number').asstring:=vseed0+vseed;
          end;
      end;
      if Adodata0457.Modified then
        Adodata0457.Post ;

      Adodata0004.close;
      Adodata0004.open;  // 取得编码规则
      if Adodata0457.Fieldbyname('gon_number').asstring>=Adodata0004.Fieldbyname('seed_value').asstring then
      begin
        Adodata0004.close;
        Adodata0004.open;  // 取得编码规则
        vseed0:='';
        Vseed1:=Adodata0457.Fieldbyname('gon_number').asstring;
        v1:=0;
        for j1:=length(trim(vseed1)) downto 1 do
        begin
          try
            if strtoint(copy(trim(vseed1),j1,1))>0 then;
          except
            v1:=1;
            break;
          end;
        end;
        if v1=0 then j1:=0;
        vseed0:=copy(trim(vseed1),1,j1);
        vseed:=copy(trim(vseed1),j1+1,Length(trim(vseed1))-j1);
        vseed:=copy(trim(inttostr(strtoint(vseed)+10000000000+1)),11-length(trim(vseed))+1,length(trim(vseed)));
        Adodata0004.Edit;
        Adodata0004.Fieldbyname('seed_value').asstring:=vseed0+vseed;
        Adodata0004.post;
      end;

      Adodata0207.First;
      with Adodata0207 do
      while not eof do
      begin
        Adodata0207.Edit;
        Adodata0207.FieldByName('GON_PTR').asstring:=Adodata0457.fieldbyname('rkey').asstring;
        next;
      end;
      Adodata0207.UpdateBatch;

      if messagedlg('列印出仓单吗？',mtconfirmation,[mbyes,mbno],0)=mrYes then
        BitBtn7Click(sender);
    end;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if trim(edit13.Text)<>'' then
    savedata(Sender);
  FrmProdResource.Free;
  FrmProdResource0.Free;
  FrmWhouse.free;
  FrmInvSearch.Free ;
  FrmEmployeeSearch.free;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  BitBtn6Click(Sender);
    with tmpAdo2 do
    begin
      close;
      Parameters.ParamByName('@vptr').Value :=Mainform.user_ptr.caption;
      open;
    end;
end;

procedure TFrmMain.Edit14Exit(Sender: TObject);
begin
  if edit14.text='' then
  begin
    messagedlg('请输入参考号！',mtinformation,[mbok],0);
    edit14.SetFocus ;
    exit;
  end;
  if edit1.Enabled =true then
    edit1.SetFocus ;
end;

procedure TFrmMain.PopupMenu2Popup(Sender: TObject);
begin
  AdoData0468.moveby(stringgrid1.Row-Adodata0468.recno);
  IF Adodata0468.FieldValues['status']=1 THEN
  begin
    N1.Enabled :=false;
    N5.Enabled :=false;
    N7.Enabled :=false;
  end else
  begin
    N1.Enabled :=true;
    N5.Enabled :=true;
    N7.Enabled :=true;
  end;

end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
var i,j:integer;
    vqty:real;
begin
  j:=0;
  i:=1;
  AdoStockDetail.First;
  while i<= stringgrid1.RowCount-1 do
  begin
    if AdoStockDetail.FieldByName('quan_on_hand').AsFloat=0 then
      AdoStockDetail.Next;
    if AdoStockDetail.Eof then exit;
    vqty:= strtofloat(Stringgrid1.Cells[6,i])
            -strtofloat(Stringgrid1.Cells[7,i])
            -strtofloat(Stringgrid1.Cells[8,i]);
    if AdoStockDetail.FieldByName('quan_on_hand').AsFloat>=vqty then
    begin
      if vqty<=0 then
      begin
        i:=i+1;
        continue;
      end;
      j:=0;
    end else
    begin
      vqty:= AdoStockDetail.FieldByName('quan_on_hand').AsFloat;
      j:=1;
    end;
    Mainform.Adoconnection1.BeginTrans ;
    try
      AdoStockDetail.Edit ;
      AdoStockDetail.FieldByName('quan_on_hand').AsFloat :=AdoStockDetail.FieldByName('quan_on_hand').AsFloat
                                      -vqty;
      AdoStockDetail.post;
      Adodate.close;
      Adodate.open;
      Adodata0468.MoveBy(i-Adodata0468.RecNo);
      if not Adodata0095.Locate('srce_ptr;reference_number',
          vararrayof([AdoStockDetail.FieldByName('rkey').Asinteger,AdoData0468.FieldByName('cut_no').Asstring]),[]) then
      begin
        Adodata0095.append;
        Adodata0095.FieldByName('tran_tp').asinteger:=12;
        Adodata0095.FieldByName('invt_ptr').asinteger:=AdoStockDetail.FieldByName('inventory_ptr').Asinteger;
        Adodata0095.FieldByName('srce_ptr').asinteger:=AdoStockDetail.FieldByName('rkey').Asinteger;
        Adodata0095.FieldByName('tran_by').asstring:=Mainform.user_ptr.Caption ;
        Adodata0095.FieldByName('rec_by').asstring:=empl_ptr.Caption ;
        Adodata0095.FieldByName('reference_number').asstring:=AdoData0468.FieldByName('cut_no').Asstring;
        Adodata0095.FieldByName('tran_date').asstring:=Adodate.fieldbyname('vdt').AsString;
      end;
      Adodata0095.edit;
      Adodata0095.FieldByName('quantity').asfloat:=Adodata0095.FieldByName('quantity').asfloat+vqty;
      Adodata0095.post;

      if not Adodata0207.Locate('d0022_ptr;d0468_ptr',
          vararrayof([AdoStockDetail.FieldByName('rkey').Asinteger,AdoData0468.FieldByName('rkey').Asinteger]),[]) then
      begin
        Adodata0207.append;
        Adodata0207.FieldByName('GON_PTR').asstring:=Adodata0457.fieldbyname('rkey').asstring;
        Adodata0207.FieldByName('inventory_ptr').asinteger:=AdoStockDetail.FieldByName('inventory_ptr').Asinteger;
        Adodata0207.FieldByName('dept_ptr').asinteger:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
        Adodata0207.FieldByName('Ttype').asinteger:=1;
        Adodata0207.FieldByName('transaction_ptr').asinteger:=AdoData0095.FieldByName('rkey').Asinteger;
        Adodata0207.FieldByName('D0468_ptr').asinteger:=AdoData0468.FieldByName('rkey').Asinteger;
        Adodata0207.FieldByName('D0022_ptr').asinteger:=AdoStockDetail.FieldByName('rkey').Asinteger;
        Adodata0207.FieldByName('tdate').asstring:=Adodate.fieldbyname('vdt').AsString;
        Adodata0207.FieldByName('standard_cost').asstring:=FrminvSearch.ADOQuery1.fieldbyname('std_cost').asstring;
      end;
      Adodata0207.edit;
      Adodata0207.FieldByName('quantity').asfloat:=Adodata0207.FieldByName('quantity').asfloat+vqty;
      Adodata0207.post;

      Adodata0468.edit;
      Adodata0468.fieldbyname('quan_issued').asfloat:=strtofloat(Stringgrid1.Cells[7,i])
                              +strtofloat(Stringgrid1.Cells[8,i])+vqty;
      IF j=0 then
        Adodata0468.FieldByName('status').asinteger:=1;
      Adodata0468.post;

      Mainform.Adoconnection1.CommitTrans ;

      Stringgrid1.Cells[8,i]:=floattostr(strtofloat(Stringgrid1.Cells[8,i])+vqty);
      edit6.text:=floattostr(strtofloat(edit6.text)+vqty);
    except
      Mainform.Adoconnection1.RollbackTrans ;
      messagedlg('资料提交不成功，项目已被其它用户使用，需要重新发料',mtinformation,[mbok],0);
      close;
    end;
    if j=0 then
      i:=i+1;
  end;
  Stringgrid1.Refresh;
end;

procedure TFrmMain.Edit15Exit(Sender: TObject);
begin
   if FrmMain.ActiveControl =bitbtn1 then exit;
   if FrmMain.ActiveControl =bitbtn2 then exit;
   FrmProdResource0.edit1.Text := edit1.Text;
   IF not FrmProdResource0.Adoquery1.Eof then
   Begin
     edit5.text:=FrmProdResource0.AdoQuery1.fieldbyname('dept_code').asstring;
     label19.Caption :=FrmProdResource0.AdoQuery1.fieldbyname('dept_name').asstring;
     edit5.SetFocus ;
   End else
   begin
    messagedlg('工序代号无效！',mtinformation,[mbok],0);
    edit5.SetFocus ;
    edit5.SelectAll ;
   end;
end;

procedure TFrmMain.BitBtn9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FrmProdResource0.edit1.Text := edit1.Text;
   IF FrmProdResource0.ShowModal=mrok then
   Begin
     edit15.text:=FrmProdResource0.AdoQuery1.fieldbyname('dept_code').asstring;
     label19.Caption :=FrmProdResource0.AdoQuery1.fieldbyname('dept_name').asstring;
     edit5.SetFocus ;
   End;
end;

end.
