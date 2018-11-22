unit Main2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB,
  ADODB, Menus;

type
  TFrmMain2 = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Label16: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    empl_ptr: TLabel;
    Label17: TLabel;
    Edit13: TEdit;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn5: TBitBtn;
    StringGrid1: TStringGrid;
    ADODate: TADOQuery;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N7: TMenuItem;
    Label8: TLabel;
    Edit5: TEdit;
    MainMenu1: TMainMenu;
    IQC1: TMenuItem;
    IQC2: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Label7: TLabel;
    Edit14: TEdit;
    ADOData0457: TADOStoredProc;
    Adodata0004: TADOStoredProc;
    ADOData0207: TADOStoredProc;
    ADOData0095: TADOStoredProc;
    tmpADO1: TADOStoredProc;
    tmpADO0: TADOStoredProc;
    tmpADO3: TADOStoredProc;
    tmpADO2: TADOStoredProc;
    ADOData0022: TADOStoredProc;
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
    procedure Edit3Enter(Sender: TObject);
    procedure BitBtn5Enter(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure N7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit14Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    procedure Savedata(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain2: TFrmMain2;

implementation

uses Prod_Resource, warehouse_search,Assigqty3,Employee_search,report6,
  Barcode_serach,mainmenu;

{$R *.dfm}

procedure TFrmMain2.Edit1Exit(Sender: TObject);
begin
   if FrmMain2.ActiveControl =bitbtn1 then exit;
   if FrmMain2.ActiveControl =bitbtn2 then exit;
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

procedure TFrmMain2.BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TFrmMain2.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain2.Edit2Exit(Sender: TObject);
begin
   if FrmMain2.ActiveControl =bitbtn1 then exit;
   if FrmMain2.ActiveControl =bitbtn4 then exit;
   FrmWhouse.edit1.Text := edit2.Text;
   IF not FrmWhouse.Adoquery1.Eof then
   Begin
     edit2.text:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_code').asstring;
     label3.Caption:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_name').asstring;
     with FrmBCSearch.ADOQuery1 do
     begin
       close;
       parameters.ParamByName('@vptr').Value :=FrmWhouse.AdoQuery1.fieldbyname('rkey').asInteger;
       open;
     end;
     edit14.SetFocus ;
   End else
   begin
    messagedlg('厂房代号无效！',mtinformation,[mbok],0);
    edit2.SetFocus ;
    edit2.SelectAll ;
   end;
end;

procedure TFrmMain2.BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FrmWhouse.edit1.Text := edit2.Text;
   IF FrmWhouse.ShowModal=mrok then
    Begin
     edit2.text:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_code').asstring;
     label3.Caption:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_name').asstring;
     with FrmBCSearch.ADOQuery1 do
      begin
       close;
       parameters.ParamByName('@vptr').Value :=FrmWhouse.AdoQuery1.fieldbyname('rkey').asInteger;
       open;
      end;
     edit14.SetFocus ;
    End;
end;

procedure TFrmMain2.FormCreate(Sender: TObject);
begin
  Adodate.Open ;
  Application.CreateForm(TFrmProdResource, FrmProdResource);
  with FrmProdResource.ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('select rkey,dept_code,dept_name,ttype');
    sql.add('from data0034');
    sql.add('where ((ttype=1 or ttype=2)');
    sql.add('and active_flag<>1');
    sql.add('and is_cost_dept=1) or ttype=4');
    sql.add('ORDER by ttype,dept_code');
    open;
  end;
  Application.CreateForm(TFrmWhouse, FrmWhouse);
  Application.CreateForm(TFrmBCSearch, FrmBCSearch);
  Application.CreateForm(TFrmEmployeeSearch, FrmEmployeeSearch);
  Adodata0207.close ;
  Adodata0207.Open ;
  Adodata0095.close;
  Adodata0095.Open ;
  with stringgrid1 do
   begin
    cells[0,0]:='材料编号';
    cells[1,0]:='材料描述';
    cells[2,0]:='单位';
    cells[3,0]:='库存数量';
    cells[4,0]:='有效期';
    cells[5,0]:='发放数量';
    cells[6,0]:='备注';
   end;
end;

procedure TFrmMain2.Edit4Exit(Sender: TObject);
begin
   if FrmMain2.ActiveControl =bitbtn1 then exit;
   if FrmMain2.ActiveControl =bitbtn3 then exit;
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

procedure TFrmMain2.BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
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
     edit3.SetFocus ;
   end;
end;

procedure TFrmMain2.BitBtn7Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport6, FrmReport6);
    with FrmReport6.Ado1 do
    begin
      close;
      Parameters.ParamByName('vptr').Value :=Adodata0457.fieldbyname('rkey').asinteger;
      open;
    end;
    FrmReport6.ADOData0493.Open ;
    FrmReport6.ppLabel24.Caption :=edit13.Text ;
    FrmReport6.ppLabel11.Caption:=edit14.Text ;
    FrmReport6.ppLabel23.Caption :=label16.caption;
    FrmReport6.ppLabel10.Caption :=tmpAdo2.fieldbyname('employee_name').AsString;
    FrmReport6.ppReport1.Print;
    FrmReport6.Free ;
end;

procedure TFrmMain2.BitBtn6Click(Sender: TObject);
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
  Adodata0457.FieldByName('TTYPE').AsString :='2';
  adodata0457.fieldbyname('REF_NUMBER').asstring:='';
  Adodata0457.Post ;
  Adodata0207.close ;
  Adodata0207.Open ;
  Adodata0095.close;
  Adodata0095.Open ;

  edit2.Enabled :=true;
  edit3.Enabled :=true;
  edit1.Enabled :=true;
  edit4.Enabled :=true;
  bitbtn4.Enabled :=true;
  bitbtn2.Enabled :=true;
  bitbtn3.Enabled :=true;
  bitbtn5.Enabled :=true;
  stringgrid1.RowCount :=2;
  stringgrid1.Rows[1].Text :='';
  bitbtn7.Enabled :=false;
  edit2.SetFocus ;
end;

procedure TFrmMain2.Savedata(Sender: TObject);
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

procedure TFrmMain2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if trim(edit13.Text)<>'' then
    savedata(Sender);
  FrmProdResource.Free;
  FrmWhouse.free;
  FrmBCSearch.Free ;
  FrmEmployeeSearch.free;
end;

procedure TFrmMain2.Edit3Enter(Sender: TObject);
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

procedure TFrmMain2.BitBtn5Enter(Sender: TObject);
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

procedure TFrmMain2.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then bitbtn5.SetFocus ;
end;

procedure TFrmMain2.N7Click(Sender: TObject);
var i:integer;
begin
  Adodata0207.MoveBy(stringgrid1.Row-Adodata0207.RecNo);

  FrmBCSearch.Adoquery1.Filter :='';
  if not FrmBCSearch.Adoquery1.Locate('rkey',Adodata0207.FieldValues['d0022_ptr'],[])
    then
   begin
    showmessage('没找到');
    exit;
   end;

  Application.CreateForm(TFrmAssigQty3, FrmAssigQty3);
  FrmAssigQty3.label3.Caption :='发出数量';
  FrmAssigQty3.label4.Caption :='退回数量';
  FrmAssigQty3.Edit1.text :=FrmBCSearch.Adoquery1.fieldbyname('inv_part_number').asstring;
  FrmAssigQty3.Edit6.text :=FrmBCSearch.Adoquery1.fieldbyname('inv_part_description').asstring;
  FrmAssigQty3.Edit2.text :=FrmBCSearch.Adoquery1.fieldbyname('expire_date').asstring;
  FrmAssigQty3.Edit3.text :=Stringgrid1.Cells[5,stringgrid1.row];
  FrmAssigQty3.Edit4.text :='0';
  FrmAssigQty3.Edit5.text :=Stringgrid1.Cells[6,stringgrid1.row];
  if FrmAssigQty3.showmodal=mrok then
  begin
    Stringgrid1.Cells[5,stringgrid1.row]:=
    floattostr(strtofloat(Stringgrid1.Cells[5,stringgrid1.row])-
    strtofloat(Frmassigqty3.Edit4.text));

    FrmBCSearch.Adoquery1.Edit ;
    FrmBCSearch.Adoquery1.fieldbyname('quan_on_hand').asfloat:=
    FrmBCSearch.Adoquery1.fieldbyname('quan_on_hand').asfloat
     +strtofloat(FrmAssigqty3.edit4.text);
    FrmBCSearch.Adoquery1.Post;

    Adodata0095.locate('srce_ptr',FrmBCSearch.Adoquery1.FieldByName('rkey').Asinteger,[]);
    Adodata0095.edit;
    Adodata0095.FieldByName('quantity').asfloat:=Adodata0095.FieldByName('quantity').asfloat-strtofloat(FrmAssigqty3.Edit4.text);
    Adodata0095.post;

    Adodata0207.locate('d0022_ptr',FrmBCSearch.Adoquery1.FieldByName('rkey').Asinteger,[]);
    Adodata0207.edit;
    Adodata0207.FieldByName('quantity').asfloat:=
              Adodata0207.FieldByName('quantity').asfloat
              -strtofloat(FrmAssigqty3.Edit4.text);
    if Adodata0207.FieldByName('quantity').AsCurrency=0 then
     begin
      Adodata0207.Delete;
      Stringgrid1.Rows[stringgrid1.row].Text :='';
      for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
        stringgrid1.Rows[i].Text :=stringgrid1.Rows[i+1].Text;
      stringgrid1.RowCount :=stringgrid1.RowCount-1;
     end
      else
      Adodata0207.post;
  end;
end;

procedure TFrmMain2.FormShow(Sender: TObject);
begin
  BitBtn6Click(Sender);
  with tmpAdo2 do
   begin
    close;
    Parameters.ParamByName('@vptr').Value :=Mainform.user_ptr.caption;
    open;
   end;
  edit5.Text :=tmpAdo2.fieldbyname('employee_name').asstring;
end;

procedure TFrmMain2.BitBtn5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

begin
  if FrmBCSearch.showmodal<>mrok then
  begin
    exit;
  end;
  Adodate.Close;
  Adodate.open;
  if FrmBCSearch.Adoquery1.fieldbyname('expire_date').asdatetime
    <=Adodate.FieldByName('vdt').asdatetime then
  begin
    messagedlg('该BARCODE号的材料已经过期！',mtinformation,[mbok],0);
    exit;
  end;
  Application.CreateForm(TFrmAssigQty3, FrmAssigQty3);
  FrmAssigQty3.Edit1.text :=FrmBCSearch.Adoquery1.fieldbyname('inv_part_number').asstring;
  FrmAssigQty3.Edit6.text :=FrmBCSearch.Adoquery1.fieldbyname('inv_part_description').asstring;
  FrmAssigQty3.Edit2.text :=FrmBCSearch.Adoquery1.fieldbyname('expire_date').asstring;
  FrmAssigQty3.Edit3.text :=FrmBCSearch.Adoquery1.fieldbyname('quan_on_hand').asstring;
  FrmAssigQty3.Edit4.text :=FrmBCSearch.Adoquery1.fieldbyname('quan_on_hand').asstring;
  FrmAssigQty3.Edit5.text :=FrmBCSearch.Adoquery1.fieldbyname('barcode_id').asstring;

  if FrmAssigQty3.showmodal=mrok then
  begin
    if Adodata0207.Locate('d0022_ptr',FrmBCSearch.Adoquery1rkey.Value,[]) then
     begin
      showmessage('该批材料已经在发放清单中,不能重复发放！如数量有误请删除后重发');
      exit;
     end;
    with Stringgrid1 do
     begin
      RowCount :=RowCount +1;
      Cells[0,rowcount-2]:=FrmBCSearch.Adoquery1.fieldbyname('inv_part_number').asstring;
      Cells[1,rowcount-2]:=FrmBCSearch.Adoquery1.fieldbyname('inv_part_description').asstring;
      Cells[2,rowcount-2]:=FrmBCSearch.Adoquery1.fieldbyname('unit_name').asstring;
      Cells[3,rowcount-2]:=FrmBCSearch.Adoquery1.fieldbyname('quan_on_hand').asstring;
      Cells[4,rowcount-2]:=FrmBCSearch.Adoquery1.fieldbyname('expire_date').asstring;
      Cells[5,rowcount-2]:=Frmassigqty3.Edit4.text;
      Cells[6,rowcount-2]:=Frmassigqty3.Edit5.text;
      Rows[stringgrid1.RowCount -1].Text :='';
     end;

    MainForm.ADOConnection1.BeginTrans;
    try

      Adodata0095.append;
      Adodata0095.FieldByName('tran_tp').asinteger:=13;    //材料出仓
      Adodata0095.FieldByName('invt_ptr').asinteger:=FrmBCSearch.Adoquery1.fieldbyname('inventory_ptr').Asinteger;
      Adodata0095.FieldByName('srce_ptr').asinteger:=FrmBCSearch.Adoquery1.fieldbyname('rkey').Asinteger;
      Adodata0095.FieldByName('tran_by').asstring:=Mainform.user_ptr.Caption ;
      Adodata0095.FieldByName('rec_by').asstring:=empl_ptr.Caption ;
      Adodata0095.FieldByName('tran_date').asstring:=Adodate.fieldbyname('vdt').AsString;
      Adodata0095.FieldByName('quantity').asfloat:=strtofloat(stringgrid1.Cells[5,stringgrid1.rowcount-2]);
      Adodata0095.post;

      Adodata0207.append;
      Adodata0207.FieldByName('GON_PTR').asstring:=Adodata0457.fieldbyname('rkey').asstring;
      Adodata0207.FieldByName('inventory_ptr').asinteger:=FrmBCSearch.Adoquery1.FieldByName('inventory_ptr').Asinteger;
      Adodata0207.FieldByName('dept_ptr').asinteger:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
      Adodata0207.FieldByName('Ttype').asinteger:=2;
      Adodata0207.FieldByName('transaction_ptr').asinteger:=AdoData0095.FieldByName('rkey').Asinteger;
      Adodata0207.FieldByName('D0022_ptr').asinteger:=FrmBCSearch.Adoquery1.FieldByName('rkey').Asinteger;
      Adodata0207.FieldByName('tdate').asstring:=Adodate.fieldbyname('vdt').AsString;
      Adodata0207.FieldByName('standard_cost').asstring:=FrmBCSearch.Adoquery1.fieldbyname('std_cost').asstring;
      Adodata0207.FieldByName('quantity').asfloat:=strtofloat(stringgrid1.Cells[5,stringgrid1.rowcount-2]);
      Adodata0207.post;


    FrmBCSearch.Adoquery1.Edit ;
    FrmBCSearch.Adoquery1.fieldbyname('quan_on_hand').asfloat:=
       FrmBCSearch.Adoquery1quan_on_hand.Value-strtofloat(stringgrid1.Cells[5,stringgrid1.rowcount-2]);
    frmbcsearch.ADOQuery1BARCODE_ID.Value:=FrmAssigqty3.Edit5.Text;
    FrmBCSearch.Adoquery1.Post;

    MainForm.ADOConnection1.CommitTrans ;
    except
     MainForm.ADOConnection1.RollbackTrans;
    end;
  end;
  FrmAssigQty3.free;
  edit2.Enabled :=false;
  edit1.Enabled :=false;
  edit4.Enabled :=false;
  bitbtn4.Enabled :=false;
  bitbtn2.Enabled :=false;
  bitbtn3.Enabled :=false;
  bitbtn7.Enabled :=true;
  edit3.Text :='';
  edit3.SetFocus ;
end;

procedure TFrmMain2.Edit14Exit(Sender: TObject);
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

procedure TFrmMain2.PopupMenu1Popup(Sender: TObject);
begin
  IF stringgrid1.row=stringgrid1.RowCount-1
  then N7.Enabled :=false
  else N7.Enabled :=true;
end;

end.
