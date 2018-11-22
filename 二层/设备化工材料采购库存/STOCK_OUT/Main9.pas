unit Main9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB,
  ADODB, Menus;

type
  TFrmMain9 = class(TForm)
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
    empl_ptr: TLabel;
    Label17: TLabel;
    Edit13: TEdit;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    StringGrid1: TStringGrid;
    ADODate: TADOQuery;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N7: TMenuItem;
    MainMenu1: TMainMenu;
    IQC1: TMenuItem;
    IQC2: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Label7: TLabel;
    Edit14: TEdit;
    ADOData0457: TADOStoredProc;
    Adodata0004: TADOStoredProc;
    tmpADO1: TADOStoredProc;
    tmpADO0: TADOStoredProc;
    tmpADO3: TADOStoredProc;
    tmpADO2: TADOStoredProc;
    ADOData0208: TADOQuery;
    N1: TMenuItem;
    BitBtn4: TBitBtn;
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Enter(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit14Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    procedure Savedata(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain9: TFrmMain9;

implementation

uses Prod_Resource, warehouse_search,Assigqty3,Employee_search,report7,
  Barcode_serach,mainmenu, inv_serach2, AssigQty5, AssigQty6;

{$R *.dfm}

procedure TFrmMain9.Edit1Exit(Sender: TObject);
begin
   if FrmMain9.ActiveControl =bitbtn1 then exit;
   if FrmMain9.ActiveControl =bitbtn2 then exit;
   FrmProdResource.edit1.Text := edit1.Text;
   IF not FrmProdResource.Adoquery1.Eof then
   Begin
     edit1.text:=FrmProdResource.AdoQuery1.fieldbyname('dept_code').asstring;
     label1.Caption :=FrmProdResource.AdoQuery1.fieldbyname('dept_name').asstring;
     edit14.SetFocus ;
   End else
   begin
    messagedlg('工序代号无效！',mtinformation,[mbok],0);
    edit1.SetFocus ;
    edit1.SelectAll ;
   end;
end;

procedure TFrmMain9.BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FrmProdResource.edit1.Text := edit1.Text;
   IF FrmProdResource.ShowModal=mrok then
   Begin
     edit1.text:=FrmProdResource.AdoQuery1.fieldbyname('dept_code').asstring;
     label1.Caption :=FrmProdResource.AdoQuery1.fieldbyname('dept_name').asstring;
     edit14.SetFocus ;
   End;
end;

procedure TFrmMain9.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain9.FormCreate(Sender: TObject);
begin
  Adodate.Open ;
  Application.CreateForm(TFrmProdResource, FrmProdResource);
  Application.CreateForm(TFrmInvSearch2, FrmInvSearch2);
  Application.CreateForm(TFrmEmployeeSearch, FrmEmployeeSearch);
  Adodata0208.close ;
  Adodata0208.Open ;
  with stringgrid1 do
  begin
    cells[0,0]:='材料代号';
    cells[1,0]:='材料名称';
    cells[2,0]:='单位';
    cells[3,0]:='Barcode号';
    cells[4,0]:='库存数量';
    cells[5,0]:='发放数量';
  end;
end;

procedure TFrmMain9.Edit4Exit(Sender: TObject);
begin
   if FrmMain9.ActiveControl =bitbtn1 then exit;
   if FrmMain9.ActiveControl =bitbtn3 then exit;
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

procedure TFrmMain9.BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
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
//     edit3.SetFocus ;
   end;
end;

procedure TFrmMain9.BitBtn7Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport7, FrmReport7);
    with FrmReport7.Ado1 do
    begin
      close;
      Parameters.ParamByName('vptr').Value :=Adodata0457.fieldbyname('rkey').asinteger;
      open;
    end;
    FrmReport7.ADOData0493.Open ;
    FrmReport7.ppLabel24.Caption :=edit13.Text ;
    FrmReport7.ppLabel11.Caption:=edit14.Text ;
    FrmReport7.ppLabel23.Caption :=label16.caption;
    FrmReport7.ppLabel10.Caption :=tmpAdo2.fieldbyname('employee_name').AsString;
    FrmReport7.ppReport1.Print;
    FrmReport7.Free ;
end;

procedure TFrmMain9.BitBtn6Click(Sender: TObject);
var
  v1,j1:integer;
  vseed,vseed0,vseed1:string;
begin
  if trim(edit13.Text)<>'' then
  begin
    savedata(Sender);
    bitbtn4.Enabled :=true;
  end;

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
  Adodata0457.Post ;
  Adodata0208.close ;
  Adodata0208.Open ;

//  edit2.Enabled :=true;
//  edit3.Enabled :=true;
  edit1.Enabled :=true;
  edit4.Enabled :=true;
//  bitbtn4.Enabled :=true;
  bitbtn2.Enabled :=true;
  bitbtn3.Enabled :=true;
//  bitbtn5.Enabled :=true;
  stringgrid1.RowCount :=2;
  stringgrid1.Rows[1].Text :='';
  bitbtn7.Enabled :=false;
//  edit2.SetFocus ;
end;

procedure TFrmMain9.Savedata(Sender: TObject);
var
  v1,j1:integer;
  vseed,vseed0,vseed1:string;
begin
{  MainForm.ADOConnection1.BeginTrans ;
  try}
    if Adodata0208.RecordCount =0 then
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

      Adodata0208.First;
      with Adodata0208 do
      while not eof do
      begin
        Adodata0208.Edit;
        Adodata0208.FieldByName('GON_PTR').asstring:=Adodata0457.fieldbyname('rkey').asstring;
        next;
      end;
      Adodata0208.UpdateBatch;
      FrmInvSearch2.ADOQuery1.UpdateBatch;

      if messagedlg('列印出仓单吗？',mtconfirmation,[mbyes,mbno],0)=mrYes then
        BitBtn7Click(sender);
    end;
{    MainForm.ADOConnection1.CommitTrans;
  except
    MainForm.ADOConnection1.RollbackTrans ;
    messagedlg('数据提交时出现冲突,提交不成功,请稍后重新进行!',mtconfirmation,[mbok],0);
    close;
  end;}
end;

procedure TFrmMain9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if trim(edit13.Text)<>'' then
    savedata(Sender);
  FrmProdResource.Free ;
  FrmInvSearch2.Free;
  FrmEmployeeSearch.free;
end;

procedure TFrmMain9.Edit3Enter(Sender: TObject);
begin
  if trim(edit4.Text)='' then
  begin
    messagedlg('请输入雇员代号！',mtinformation,[mbok],0);
    edit4.SetFocus ;
    exit;
  end;
  if trim(edit1.Text)='' then
  begin
    messagedlg('请输入领料部门！',mtinformation,[mbok],0);
    edit1.SetFocus ;
    exit;
  end;
end;

procedure TFrmMain9.N7Click(Sender: TObject);
begin
    Application.CreateForm(TFrmAssigQty6, FrmAssigQty6);
    FrmAssigQty6.Edit1.Text :=Stringgrid1.Cells[0,stringgrid1.Row];
    FrmAssigQty6.Edit2.Text :=Stringgrid1.Cells[1,stringgrid1.Row];
    FrmAssigQty6.Edit3.Text :=Stringgrid1.Cells[2,stringgrid1.Row];
    FrmAssigQty6.Edit5.Text :=Stringgrid1.Cells[3,stringgrid1.Row];
    FrmAssigQty6.Edit6.Text :=Stringgrid1.Cells[4,stringgrid1.Row];
    FrmAssigQty6.Edit7.Text :=Stringgrid1.Cells[5,stringgrid1.Row];
    FrmAssigQty6.Edit4.Text :=Stringgrid1.Cells[5,stringgrid1.Row];
    if FrmAssigQty6.showmodal=mrok then
    begin
      Stringgrid1.RowCount :=Stringgrid1.RowCount+1;
      with Stringgrid1 do
      begin
        cells[0,stringgrid1.Row]:=FrmInvSearch2.ADOQuery1.fieldbyname('description').AsString;
        cells[1,stringgrid1.Row]:=FrmInvSearch2.ADOQuery1.fieldbyname('unit_code').AsString;
        cells[2,stringgrid1.Row]:=FrmInvSearch2.ADOQuery1.fieldbyname('curr_code').AsString;
        cells[3,stringgrid1.Row]:=FrmInvSearch2.ADOQuery1.fieldbyname('unit_price').AsString;
        cells[4,stringgrid1.Row]:=FrmInvSearch2.ADOQuery1.fieldbyname('date_recd').AsString;
        cells[5,stringgrid1.Row]:=Floattostr(Strtofloat(Stringgrid1.cells[5,stringgrid1.Row])-strtofloat(Trim(FrmAssigQty6.Edit4.Text)));
      end;
      Adodata0208.MoveBy(Stringgrid1.Row-Adodata0208.RecNo);
      with Adodata0208 do
      begin
        Edit;;
        FieldByName('GON_PTR').asstring:=Adodata0457.fieldbyname('rkey').asstring;
        FieldByName('source_ptr').asinteger:=FrmInvSearch2.ADOQuery1.fieldbyname('rkey').AsInteger;
        FieldByName('dept_ptr').asinteger:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
        FieldByName('tdate').asstring:=Adodate.fieldbyname('vdt').AsString;
        FieldByName('quantity').asfloat:=Strtofloat(Stringgrid1.cells[5,stringgrid1.Row])-strtofloat(Trim(FrmAssigQty6.Edit4.Text));
        post;
      end;
      with FrmInvSearch2.ADOQuery1 do
      begin
        Edit;
        fieldbyname('quan_on_hand').AsFloat:=fieldbyname('quan_on_hand').AsFloat
          + strtofloat(FrmAssigqty6.Edit4.text);
        post;
      end;
    end;
    FrmAssigQty6.free;
end;

procedure TFrmMain9.FormShow(Sender: TObject);
begin
   BitBtn6Click(Sender);
    with tmpAdo2 do
    begin
      close;
      Parameters.ParamByName('@vptr').Value :=Mainform.user_ptr.caption;
      open;
    end;
end;

procedure TFrmMain9.Edit14Exit(Sender: TObject);
begin
  if edit14.text='' then
  begin
    messagedlg('请输入参考号！',mtinformation,[mbok],0);
    edit14.SetFocus ;
    exit;
  end;
  if edit4.Enabled =true then
    edit4.SetFocus ;
end;

procedure TFrmMain9.PopupMenu1Popup(Sender: TObject);
begin
  IF stringgrid1.row=stringgrid1.RowCount-1
  then N7.Enabled :=false
  else N7.Enabled :=true;
end;

procedure TFrmMain9.N1Click(Sender: TObject);
begin
  if FrmInvSearch2.showmodal=mrok then
  begin
    Application.CreateForm(TFrmAssigQty5, FrmAssigQty5);
    FrmAssigQty5.Edit1.Text :=FrmInvSearch2.ADOQuery1.fieldbyname('description').AsString;
    FrmAssigQty5.Edit2.Text :=FrmInvSearch2.ADOQuery1.fieldbyname('unit_code').AsString;
    FrmAssigQty5.Edit3.Text :=FrmInvSearch2.ADOQuery1.fieldbyname('curr_code').AsString;
    FrmAssigQty5.Edit5.Text :=FrmInvSearch2.ADOQuery1.fieldbyname('unit_price').AsString;
    FrmAssigQty5.Edit6.Text :=FrmInvSearch2.ADOQuery1.fieldbyname('date_recd').AsString;
    FrmAssigQty5.Edit7.Text :=FrmInvSearch2.ADOQuery1.fieldbyname('quan_on_hand').AsString;
    FrmAssigQty5.Edit4.Text :=FrmInvSearch2.ADOQuery1.fieldbyname('quan_on_hand').AsString;
    if FrmAssigQty5.showmodal=mrok then
    begin
      Stringgrid1.RowCount :=Stringgrid1.RowCount+1;
      Stringgrid1.Rows[Stringgrid1.RowCount-1].Text:='';
      with Stringgrid1 do
      begin
        cells[0,Stringgrid1.RowCount-2]:=FrmInvSearch2.ADOQuery1.fieldbyname('description').AsString;
        cells[1,Stringgrid1.RowCount-2]:=FrmInvSearch2.ADOQuery1.fieldbyname('unit_code').AsString;
        cells[2,Stringgrid1.RowCount-2]:=FrmInvSearch2.ADOQuery1.fieldbyname('curr_code').AsString;
        cells[3,Stringgrid1.RowCount-2]:=FrmInvSearch2.ADOQuery1.fieldbyname('unit_price').AsString;
        cells[4,Stringgrid1.RowCount-2]:=FrmInvSearch2.ADOQuery1.fieldbyname('date_recd').AsString;
        cells[5,Stringgrid1.RowCount-2]:=Trim(FrmAssigQty5.Edit4.Text);
      end;
      with Adodata0208 do
      begin
        Append;
        FieldByName('GON_PTR').asstring:=Adodata0457.fieldbyname('rkey').asstring;
        FieldByName('source_ptr').asinteger:=FrmInvSearch2.ADOQuery1.fieldbyname('rkey').AsInteger;
        FieldByName('dept_ptr').asinteger:=FrmProdResource.AdoQuery1.fieldbyname('rkey').asinteger;
        FieldByName('tdate').asstring:=Adodate.fieldbyname('vdt').AsString;
        FieldByName('quantity').asfloat:=strtofloat(FrmAssigqty5.Edit4.text);
        post;
      end;
      with FrmInvSearch2.ADOQuery1 do
      begin
        Edit;
        fieldbyname('quan_on_hand').AsFloat:=fieldbyname('quan_on_hand').AsFloat
          - strtofloat(FrmAssigqty5.Edit4.text);
        post;
      end;
    end;
    FrmAssigQty5.free;
    bitbtn4.Enabled :=true;
  end;
end;

procedure TFrmMain9.BitBtn4Click(Sender: TObject);
begin
  if trim(edit13.Text)<>'' then
  begin
    savedata(Sender);
    bitbtn4.Enabled :=true;
  end;
end;

end.
