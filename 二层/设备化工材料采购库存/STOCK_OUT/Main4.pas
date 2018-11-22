unit Main4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB,
  ADODB, Menus;

type
  TFrmMain4 = class(TForm)
    MainMenu1: TMainMenu;
    IQC1: TMenuItem;
    IQC2: TMenuItem;
    N2: TMenuItem;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    N4: TMenuItem;
    Label1: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Label16: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    Label17: TLabel;
    Edit13: TEdit;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    StringGrid1: TStringGrid;
    ADODate: TADOQuery;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N7: TMenuItem;
    Label7: TLabel;
    Edit5: TEdit;
    BitBtn8: TBitBtn;
    empl_ptr: TLabel;
    ADOData0022: TADOStoredProc;
    ADOData0457: TADOStoredProc;
    Adodata0004: TADOStoredProc;
    ADOData0207: TADOStoredProc;
    ADOData0095: TADOStoredProc;
    ADOData0458: TADOStoredProc;
    RtnADOData0207: TADOStoredProc;
    ADOData0468: TADOStoredProc;
    tmpADO1: TADOStoredProc;
    tmpADO0: TADOStoredProc;
    tmpADO3: TADOStoredProc;
    tmpADO2: TADOStoredProc;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn5: TBitBtn;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    ADOQuery1: TADOStoredProc;
    ADOQuery1gon_number: TStringField;
    ADOQuery1ref_number: TStringField;
    ADOQuery1create_date: TDateTimeField;
    ADOQuery1inv_part_number: TStringField;
    ADOQuery1inv_part_description: TStringField;
    ADOQuery1unit_code: TStringField;
    ADOQuery1barcode_id: TStringField;
    ADOQuery1code: TStringField;
    ADOQuery1quantity: TBCDField;
    ADOQuery1ship_date: TDateTimeField;
    ADOQuery1D0022_PTR: TIntegerField;
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit14Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    procedure Savedata(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain4: TFrmMain4;

implementation

uses Prod_Resource, warehouse_search,Assigqty4,Employee_search,report6,
  Barcode_serach, RetnMATLAssign2,MAINMenu, Barcode_serach2;

{$R *.dfm}

procedure TFrmMain4.Edit1Exit(Sender: TObject);
begin
   if FrmMain4.ActiveControl =bitbtn1 then exit;
   if FrmMain4.ActiveControl =bitbtn2 then exit;
   FrmProdResource.edit1.Text := edit1.Text;
   IF not FrmProdResource.Adoquery1.Eof then
   Begin
     edit1.text:=FrmProdResource.AdoQuery1.fieldbyname('dept_code').asstring;
     label1.Caption :=FrmProdResource.AdoQuery1.fieldbyname('dept_name').asstring;
     edit4.SetFocus ;
   End else
   begin
    messagedlg('工序代号无效！',mtinformation,[mbok],0);
    edit1.SetFocus ;
    edit1.SelectAll ;
   end;
end;

procedure TFrmMain4.BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FrmProdResource.edit1.Text := edit1.Text;
   IF FrmProdResource.ShowModal=mrok then
   Begin
     edit1.text:=FrmProdResource.AdoQuery1.fieldbyname('dept_code').asstring;
     label1.Caption :=FrmProdResource.AdoQuery1.fieldbyname('dept_name').asstring;
     edit4.SetFocus ;
   End;
end;

procedure TFrmMain4.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain4.Edit2Exit(Sender: TObject);
begin
   if FrmMain4.ActiveControl =bitbtn1 then exit;
   if FrmMain4.ActiveControl =bitbtn4 then exit;
   FrmWhouse.edit1.Text := edit2.Text;
   IF not FrmWhouse.Adoquery1.Eof then
   Begin
     edit2.text:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_code').asstring;
     label3.Caption:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_name').asstring;
     edit1.SetFocus ;
     with FrmBCSearch.ADOQuery1 do
     begin
       close;
       Parameters.ParamByName('@vptr').value:=FrmWhouse.AdoQuery1.fieldbyname('rkey').asstring;
       open;
     end;
   End else
   begin
    messagedlg('厂房代号无效！',mtinformation,[mbok],0);
    edit2.SetFocus ;
    edit2.SelectAll ;
   end;
end;

procedure TFrmMain4.BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FrmWhouse.edit1.Text := edit2.Text;
   IF FrmWhouse.ShowModal=mrok then
   Begin
     edit2.text:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_code').asstring;
     label3.Caption:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_name').asstring;
     edit1.SetFocus ;
     with FrmBCSearch.ADOQuery1 do
     begin
       close;
       Parameters.ParamByName('@vptr').value:=FrmWhouse.AdoQuery1.fieldbyname('rkey').asstring;
       open;
     end;
   End;
end;

procedure TFrmMain4.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TFrmProdResource, FrmProdResource);
  Application.CreateForm(TFrmWhouse, FrmWhouse);
  Application.CreateForm(TFrmBCSearch, FrmBCSearch);
  Application.CreateForm(TFrmEmployeeSearch, FrmEmployeeSearch);
  if Adodata0207.Active =false then Adodata0207.Open ;
  if Adodata0095.Active =false then Adodata0095.Open ;
  with stringgrid1 do
  begin
    cells[0,0]:='材料代号';
    cells[1,0]:='单位';
    cells[2,0]:='Barcode号';
    cells[3,0]:='类别';
    cells[4,0]:='发放日期';
    cells[5,0]:='发放数量';
    cells[6,0]:='已退数量';
    cells[7,0]:='退回数量';
    cells[8,0]:='材料名称';
  end;
  with FrmProdResource.ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('select rkey,dept_code,dept_name,ttype');
    sql.add('from data0034');
    sql.add('where ((ttype=1 or ttype=2)');
    sql.add('and active_flag<>1) or ttype=4');
    sql.add('ORDER by ttype,dept_code');
    open;
  end;
end;

procedure TFrmMain4.Edit4Exit(Sender: TObject);
begin
   if FrmMain4.ActiveControl =bitbtn1 then exit;
   if FrmMain4.ActiveControl =bitbtn3 then exit;
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

procedure TFrmMain4.BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
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
        Fieldbyname('recd_by').asstring:=empl_ptr.Caption;
        post;
      end;
     edit7.SetFocus ;
   end;
end;

procedure TFrmMain4.BitBtn7Click(Sender: TObject);
begin
  if trim(edit13.Text)='' then exit;
    Application.CreateForm(TFrmReport6, FrmReport6);
    with FrmReport6.Ado1 do
    begin
      close;
      Parameters.ParamByName('vptr').Value :=Adodata0457.fieldbyname('rkey').asinteger;
      open;
    end;
    FrmReport6.ADOData0493.Open ;
    FrmReport6.ppLabel24.Caption :=edit13.Text ;
    FrmReport6.ppLabel23.Caption :=label16.caption;
    FrmReport6.ppLabel10.Caption :=tmpAdo2.fieldbyname('employee_name').AsString;
    FrmReport6.ppReport1.Print;
    FrmReport6.Free ;
end;

procedure TFrmMain4.BitBtn6Click(Sender: TObject);
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
  Adodata0457.FieldByName('ttype').AsString :='4';
  adodata0457.fieldbyname('REF_NUMBER').asstring:='';
  Adodata0457.post ;

  edit2.Enabled :=true;
  edit3.Enabled :=true;
  bitbtn5.Enabled :=true;
  edit1.Enabled :=true;
  edit4.Enabled :=true;
  bitbtn4.Enabled :=true;
  bitbtn2.Enabled :=true;
  bitbtn3.Enabled :=true;
  bitbtn8.Enabled :=true;
  stringgrid1.RowCount :=2;
  stringgrid1.Rows[1].Text :='';
  bitbtn7.Enabled :=false;
  edit2.SetFocus ;
end;

procedure TFrmMain4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if trim(edit13.Text)<>'' then
    savedata(Sender);
  FrmProdResource.Free;
  FrmWhouse.free;
  FrmBCSearch.free;
  FrmEmployeeSearch.free;
end;

procedure TFrmMain4.Edit3Exit(Sender: TObject);
begin
//  if trim(edit3.Text)='' then exit;
  with Adodata0022 do
   begin
    close;
    Parameters.ParamByName('@vptr').value:=self.ADOQuery1D0022_PTR.Value;
    open;
   end;
{  if Adodata0022.fieldbyname('whouse_ptr').AsInteger<>FrmWhouse.AdoQuery1.fieldbyname('rkey').asinteger then
  begin
    messagedlg('该BARCODE号不在'+edit2.text+'！',mtinformation,[mbok],0);
    exit;
  end;
  if Adodata0022.RecordCount =0 then
  begin
    messagedlg('该BARCODE号无效！',mtinformation,[mbok],0);
    exit;
  end;   }
  with rtnAdodata0207 do
  begin
    close;
    Parameters.ParamByName('@vptr1').value:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
    Parameters.ParamByName('@vptr2').value:=Adodata0022.fieldbyname('rkey').asinteger;
    open;
  end;
  if rtnAdodata0207.RecordCount =0 then
  begin
    messagedlg('没有在发到该工序的材料项目中找到该BARCODE号！',mtinformation,[mbok],0);
    exit;
  end;
  with rtnAdodata0207 do
  while not eof do
  begin
    with Stringgrid1 do
      begin
        RowCount :=RowCount +1;
        Cells[0,rowcount-2]:=Adodata0022.fieldbyname('inv_part_number').asstring;
        Cells[1,rowcount-2]:=Adodata0022.fieldbyname('unit_code').asstring;
        Cells[2,rowcount-2]:=Adodata0022.fieldbyname('barcode_id').asstring;
        case rtnAdodata0207.fieldbyname('ttype').asinteger of
        1: Cells[3,rowcount-2]:='到配料单';
        2: Cells[3,rowcount-2]:='到部门';
        3: Cells[3,rowcount-2]:='到车间库存';
        end;
        Cells[4,rowcount-2]:=rtnAdodata0207.fieldbyname('tdate').asstring;
        Cells[5,rowcount-2]:=rtnAdodata0207.fieldbyname('quantity').asstring;
        Cells[6,rowcount-2]:=rtnAdodata0207.fieldbyname('rtn_quantity').asstring;
        Cells[7,rowcount-2]:='0';
        Cells[8,rowcount-2]:=Adodata0022.fieldbyname('inv_part_description').asstring;
        stringgrid1.Rows[stringgrid1.RowCount -1].Text :='';
      end ;
    next;
  end;
  edit2.Enabled :=false;
  edit1.Enabled :=false;
  edit3.Enabled :=false;
  bitbtn5.Enabled :=false;
  edit4.Enabled :=false;
  bitbtn4.Enabled :=false;
  bitbtn2.Enabled :=false;
  bitbtn3.Enabled :=false;
  bitbtn7.Enabled :=true;
  stringgrid1.SetFocus ;
end;

procedure TFrmMain4.Edit3Enter(Sender: TObject);
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

procedure TFrmMain4.N7Click(Sender: TObject);
begin
  IF RtnAdodata0207.Active =false then exit;
  IF RtnAdodata0207.recordcount=0 then exit;
  RtnAdodata0207.MoveBy(stringgrid1.row-RtnAdoData0207.RecNo);

  if rtnAdodata0207.fieldbyname('ttype').asinteger=1 then
  with Adodata0468 do
  begin
    close;
    Parameters.ParamByName('@vptr').value:=rtnAdodata0207.fieldbyname('d0468_ptr').asinteger;
    open;
  end;
  if rtnAdodata0207.fieldbyname('ttype').asinteger=3 then
  with Adodata0458 do
  begin
    close;
    Parameters.ParamByName('@vptr1').value:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
    Parameters.ParamByName('@vptr2').value:=rtnAdodata0207.fieldbyname('inventory_ptr').asinteger;
    open;
  end;

  Application.CreateForm(TFrmRtnQty2, FrmRtnQty2);
  Mainform.Adoconnection1.BeginTrans ;
  try

    if rtnAdodata0207.fieldbyname('ttype').asinteger=1 then
    begin
      FrmRtnQty2.Edit1.text :=Adodata0022.fieldbyname('inv_part_number').asstring;
      FrmRtnQty2.Edit2.text :=rtnAdodata0207.fieldbyname('tdate').asstring;
      FrmRtnQty2.Edit3.text :=floattostr(rtnAdodata0207.fieldbyname('quantity').asfloat-rtnAdodata0207.fieldbyname('rtn_quantity').asfloat);
      FrmRtnQty2.Edit4.text :='0';
      FrmRtnQty2.Edit5.text :=Adodata0468.fieldbyname('cut_no').asstring;
      if FrmRtnQty2.showmodal=mrok then
      begin
        Adodata0468.Edit ;
        Adodata0468.fieldbyname('quan_issued').asfloat:=Adodata0468.fieldbyname('quan_issued').asfloat
                                                        -strtofloat(FrmRtnQty2.edit4.text);
        Adodata0468.fieldbyname('status').asinteger:=0;
        Adodata0468.Post;
      end else
      begin
        Mainform.Adoconnection1.RollbackTrans;
        FrmRtnQty2.free;
        exit;
      end;
    end;

    if rtnAdodata0207.fieldbyname('ttype').asinteger=2 then
    begin
      FrmRtnQty2.Edit1.text :=Adodata0022.fieldbyname('inv_part_number').asstring;
      FrmRtnQty2.Edit2.text :=rtnAdodata0207.fieldbyname('tdate').asstring;
      FrmRtnQty2.Edit3.text :=rtnAdodata0207.fieldbyname('quantity').asstring;
      FrmRtnQty2.Edit4.text :='0';
      FrmRtnQty2.label5.visible:=false;
      FrmRtnQty2.Edit5.visible:=false;
      if FrmRtnQty2.showmodal<>mrok then
      begin
        Mainform.Adoconnection1.RollbackTrans;
        FrmRtnQty2.free;
        exit;
      end;
    end;

    if rtnAdodata0207.fieldbyname('ttype').asinteger=3 then
    begin
      FrmRtnQty2.Edit1.text :=Adodata0022.fieldbyname('inv_part_number').asstring;
      FrmRtnQty2.Edit2.text :=rtnAdodata0207.fieldbyname('tdate').asstring;
      FrmRtnQty2.Edit3.text :=rtnAdodata0207.fieldbyname('quantity').asstring;
      FrmRtnQty2.Edit4.text :='0';
      FrmRtnQty2.label5.caption :='当前车间存量';
      FrmRtnQty2.Edit5.text :=floattostr(Adodata0458.fieldbyname('bal_qty').asfloat);
      if FrmRtnQty2.showmodal=mrok then
      begin
        Adodata0458.edit;
        Adodata0458.fieldbyname('last_date').asstring:=datetostr(Adodate.fieldbyname('vdt').asdatetime);
        Adodata0458.fieldbyname('bal_qty').asfloat:=Adodata0458.fieldbyname('bal_qty').asfloat
                                                      +strtofloat(FrmRtnQty2.edit4.text);
        Adodata0458.Post;
      end else
      begin
        Mainform.Adoconnection1.RollbackTrans;
        FrmRtnQty2.free;
        exit;
      end;
    end;

    Adodata0022.Edit ;
    Adodata0022.fieldbyname('quan_on_hand').asfloat:=Adodata0022.fieldbyname('quan_on_hand').asfloat
                                                      +strtofloat(FrmRtnQty2.edit4.text);
    Adodata0022.Post;

    Adodata0095.append;
    Adodata0095.FieldByName('tran_tp').asinteger:=15;
    Adodata0095.FieldByName('invt_ptr').asinteger:=Adodata0022.FieldByName('inventory_ptr').Asinteger;
    Adodata0095.FieldByName('srce_ptr').asinteger:=Adodata0022.FieldByName('rkey').Asinteger;
    Adodata0095.FieldByName('tran_by').asstring:=Mainform.user_ptr.Caption ;
    Adodata0095.FieldByName('rec_by').asstring:=empl_ptr.Caption ;
    Adodata0095.FieldByName('tran_date').asstring:=Adodate.fieldbyname('vdt').AsString;
    Adodata0095.FieldByName('quantity').asfloat:=0-strtofloat(FrmRtnQty2.Edit4.text);
    Adodata0095.post;

    Adodata0207.append;
    Adodata0207.FieldByName('GON_PTR').asstring:=Adodata0457.fieldbyname('rkey').asstring;
    Adodata0207.FieldByName('inventory_ptr').asinteger:=Adodata0022.FieldByName('inventory_ptr').Asinteger;
    Adodata0207.FieldByName('dept_ptr').asinteger:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
    Adodata0207.FieldByName('Ttype').asinteger:=4;
    Adodata0207.FieldByName('transaction_ptr').asinteger:=AdoData0095.FieldByName('rkey').Asinteger;
    Adodata0207.FieldByName('D0022_ptr').asinteger:=Adodata0022.FieldByName('rkey').Asinteger;
    Adodata0207.FieldByName('tdate').asstring:=Adodate.fieldbyname('vdt').AsString;
    Adodata0207.FieldByName('standard_cost').asstring:=Adodata0022.fieldbyname('std_cost').asstring;
    Adodata0207.FieldByName('quantity').asfloat:=0-strtofloat(FrmRtnQty2.Edit4.text);
    Adodata0207.post;

    rtnAdodata0207.edit;
    rtnAdodata0207.FieldByName('rtn_quantity').asfloat:=rtnAdodata0207.FieldByName('rtn_quantity').asfloat
                                                      +strtofloat(FrmRtnQty2.Edit4.text);
    rtnAdodata0207.post;
    stringgrid1.Cells[7,stringgrid1.row]:=Floattostr(strtofloat(stringgrid1.Cells[7,stringgrid1.row])
                                        +strtofloat(FrmRtnQty2.Edit4.text));
    FrmRtnQty2.free;
    Mainform.Adoconnection1.CommitTrans ;
  except
    Mainform.Adoconnection1.RollbackTrans ;
    messagedlg('数据提交不成功，记录可能被其他用户锁定，请稍后重新尝试！',mtinformation,[mbok],0);
    exit;
  end;
end;

procedure TFrmMain4.FormShow(Sender: TObject);
begin
    BitBtn6Click(Sender);
    with tmpAdo2 do
    begin
      close;
      Parameters.ParamByName('@vptr').Value :=strtoint(trim(Mainform.user_ptr.caption));
      open;
    end;
    edit5.Text :=tmpAdo2.fieldbyname('employee_name').asstring;
end;

procedure TFrmMain4.Edit14Exit(Sender: TObject);
begin
  if edit1.Enabled =true then
     edit1.SetFocus ;
end;

procedure TFrmMain4.BitBtn8Click(Sender: TObject);
begin
  Edit3.Enabled :=true;
  bitbtn5.Enabled :=true;
  Edit3.Text :='';
  stringgrid1.RowCount :=2;
  stringgrid1.Rows[1].Text :='';
  edit7.SetFocus ;
end;

procedure TFrmMain4.Savedata(Sender: TObject);
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

procedure TFrmMain4.PopupMenu1Popup(Sender: TObject);
begin
  if Stringgrid1.Row =stringgrid1.RowCount-1 then exit;
  if strtofloat(FrmMain4.stringgrid1.Cells[5,FrmMain4.stringgrid1.row])
    <=strtofloat(FrmMain4.stringgrid1.Cells[6,FrmMain4.stringgrid1.row])
     +strtofloat(FrmMain4.stringgrid1.Cells[7,FrmMain4.stringgrid1.row]) then
     n7.Enabled :=false
  else
     n7.Enabled :=true;
end;

procedure TFrmMain4.BitBtn5Click(Sender: TObject);
begin
  if (trim(Edit7.Text)='') and (trim(Edit6.Text)='') then
  begin
    messagedlg('请输入一个出仓单号或领料单号！',mtinformation,[mbok],0);
    exit;
  end;
  with Adoquery1 do
   begin
    close;
    parameters.ParamByName('@vptr').Value :=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
    parameters.ParamByName('@vptr0').Value :=FrmWhouse.AdoQuery1.fieldbyname('rkey').asinteger;
    parameters.ParamByName('@vptr1').Value :=trim(Edit7.Text)+'%';
    parameters.ParamByName('@vptr2').Value :=trim(Edit6.Text)+'%';
    open;
   end;
  Application.CreateForm(TFrmBCSearch2, FrmBCSearch2);
  if FrmBCSearch2.showmodal=mrok then
   begin
    Edit3.Text :=Adoquery1.fieldbyname('barcode_id').AsString;
    Edit3.SetFocus;
    stringgrid1.SetFocus ;
   end;
  FrmBCSearch2.free;
end;

end.
