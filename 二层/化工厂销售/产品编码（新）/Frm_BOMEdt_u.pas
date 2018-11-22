unit Frm_BOMEdt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, DB, ADODB, Mask, DBCtrls,
  Grids, DBGridEh, Menus;

type
  TFrm_BOMEdt = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ADO148_s: TADOQuery;
    ADO140: TADOQuery;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    BtnAdd: TSpeedButton;
    BtnDel: TSpeedButton;
    BtnOK: TSpeedButton;
    Label12: TLabel;
    Edit12: TEdit;
    Label13: TLabel;
    Edit13: TEdit;
    BtnCancel: TSpeedButton;
    BtnIn: TSpeedButton;
    BtnEdit: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label14: TLabel;
    SGrid: TStringGrid;
    Panel1: TPanel;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    Edit14: TEdit;
    Label10: TLabel;
    Button1: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    bbt_1: TBitBtn;
    Label15: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BOM1: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    qryADO148_sort: TADOQuery;
    lbl1: TLabel;
    Label16: TLabel;
    ComboBox1: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    ComboBox2: TComboBox;
    Label19: TLabel;
    Edit15: TEdit;
    Label20: TLabel;
    Edit16: TEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnInClick(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure bbt_1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SGridDblClick(Sender: TObject);
    procedure SGridClick(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    Fst, ZYtag: integer;   //0:Edit 1:Add
    function GetFL(rkey148:integer):boolean;
    Procedure EnbBtns(st:integer);//1 Browse 2 edit 3 Add
  public
    Ftag,Frkey140,newrownumber:integer;
    procedure init;
  end;

var
  Frm_BOMEdt: TFrm_BOMEdt;

implementation
 uses DM_u,Frm_MatSelect_u,common,Pick_Item_Single, ConstVar, Types;
{$R *.dfm}

{ TFrm_BOMEdt }

procedure TFrm_BOMEdt.init;
var i,j:integer;
begin
  newrownumber := 0;
  Fst:=0;
  Edit1.Text:=DM.D08PROD_CODE.Value;
  Edit3.Text:=DM.D08PRODUCT_NAME.Value;
  {DM.ADO148.Close;
  DM.ADO148.Parameters[0].Value := DM.D08RKEY.AsString;
  DM.ADO148.Parameters[1].Value := DM.D08RKEY.AsString;
  DM.ADO148.Open; }
 // ShowMessage(IntToStr(DM.ADO148.FieldCount-5));

  for i:=0 to DM.ADO148.FieldCount-5 do  //DM.AD0148列数【0.21】 fieldcount=22
  begin
    SGrid.Cells[i,0]:=DM.ADO148.Fields[i].DisplayLabel;
    if i < 10 then
      SGrid.ColWidths[i]:=DM.ADO148.Fields[i].DisplayWidth
    else
      SGrid.ColWidths[i]:=-1;
  end;

  SGrid.Cells[0,0] :='序号';
  SGrid.ColWidths[0]:=30;
  SGrid.ColWidths[4]:=50;
  SGrid.ColWidths[14]:=50;
  SGrid.ColWidths[15]:=50;
  SGrid.ColWidths[16]:=50;
  SGrid.ColWidths[17]:=70;
   SGrid.ColWidths[18]:=70;
   SGrid.ColWidths[19]:=70;
   SGrid.ColWidths[20]:=70;
  if Ftag=1 then    //Edit
  begin 
    SGrid.RowCount:=DM.ADO148.RecordCount+2;
    DM.ADO148.First;

    Edit2.Text:=DM.ADO140part_name.Value;
    Edit4.Text:=DM.ADO148inv_part_number.AsString;
    Edit5.Text:=DM.ADO148inv_name.AsString;
    Edit6.Text:=DM.ADO148INV_DESCRIPTION.AsString;
    Edit7.Text:=DM.ADO148inv_part_number_r.AsString;
    Edit8.Text:=DM.ADO148inv_name_r.AsString;
    Edit9.Text:=DM.ADO148INV_DESCRIPTION_r.AsString;
    Edit10.Text:=DM.ADO148QUAN_BOM.AsString;
    Edit11.Text:=DM.ADO148VENDOR.AsString;
    Edit12.Text:=DM.ADO148STD_cost.AsString;
    Edit13.Text:=DM.ADO148unit_name.AsString;
    Edit15.Text := DM.ADO148STOP_PURCH.AsString;
    Edit16.Text := DM.ADO148STOP_PURCH1.AsString;
    
    if DM.ADO148p_code.IsNull
    then ComboBox1.ItemIndex := -1
    else ComboBox1.ItemIndex := dm.ADO148p_code.AsInteger-1;

        if DM.ADO148production_teamname.IsNull
    then ComboBox2.ItemIndex := -1
    else ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(dm.ADO148production_teamname.AsString);
    // ComboBox2 := dm.ADO148production_teamname.AsString;

    //ComboBox1.Text := dm.ADO148p_code.AsString;
    Edit4.Tag:=DM.ADO148.FieldByName('INVENT_PTR').AsInteger;
    Edit7.tag:=DM.ADO148.FieldByName('repl_invt_ptr').AsInteger;
    Edit10.Tag:=DM.ADO148.FieldByName('Invent_or').AsInteger;
    
    j:=1;
    while not DM.ADO148.Eof do
    begin
      for i:=0 to DM.ADO148.FieldCount-5 do     //[0...21][1...22]
        SGrid.Cells[i,j]:=DM.ADO148.Fields[i].AsString;
        inc(j);
        DM.ADO148.Next;

    end;
     newrownumber := j;
    // ShowMessage(IntToStr(j));
    //j就是序号
    ADO140.Parameters[0].Value:=DM.ADO140rkey.Value;
    ADO140.Open;
    
    ADO148_s.Close;
    ADO148_s.Parameters[0].Value:=DM.ADO140rkey.Value;
    ADO148_s.Open;
  end
  else begin    //add
    ADO140.Parameters[0].Value:=-1;
    ADO140.Open;    

    ADO148_s.Close;
    ADO148_s.Parameters[0].Value:=-1;
    ADO148_s.Open;
  end;
  EnbBtns(1);
end;

procedure TFrm_BOMEdt.SpeedButton2Click(Sender: TObject);
begin
  if MessageDlg('确定要不保存退出吗？',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Frm_MatSelect.Free;
    Frm_MatSelect:=nil;
    close;
  end;
end;

procedure TFrm_BOMEdt.SpeedButton3Click(Sender: TObject);
var i,j:integer;
begin

  if Fst=0 then  //Edit
  begin
    if ADO148_s.Locate('INVENT_PTR;Invent_or',VarArrayOf([Edit4.tag,Edit10.Tag]),[])//原材料非成品
    and GetFL(ADO148_s.fieldbyname('rkey').AsInteger) then
    begin
      showmessage('此物料已产生领料单,不能删除...');
      exit;
    end;
    j:=2
  end
  else
    j:=3;

  if (TSpeedButton(sender).Tag=1) and (Edit4.Text='') then
  begin
    showmessage('请先选择主物料...');
    exit;
  end;
    
  if TSpeedButton(sender).Tag=0 then FSTOP_PURCH:=' and d17.STOP_PURCH=''N'' ' else FSTOP_PURCH:=' and 1=1 ';

  if Frm_MatSelect=nil then
  begin
     //ShowMessage('1');
    Frm_MatSelect:=TFrm_MatSelect.Create(nil);
    try
    Frm_MatSelect.init;
    except on e:Exception do
      begin
      ShowMessage(e.message+'物料查询失败');
      exit;
      end;
   end; 
    //ShowMessage('init');
  end;

  //ShowMessage('全新增');
  if Frm_MatSelect.ShowModal=mrok then
  begin
    if TSpeedButton(sender).Tag=0 then   //主物料在选
    begin
      if (Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('FisMAt').AsInteger=1) then SpeedButton4.Enabled:=False else SpeedButton4.Enabled:=True;
      //
      for i:=1 to SGrid.RowCount-j do
      begin
        if (SGrid.Cells[10,i]=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('rkey').AsString) and

           (SGrid.Cells[11,i]=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('FisMAt').AsString) then    //invent_ptr
        begin
          showmessage('您添加的物料在此BOM中已经存在..！'+#13+#13+'在BOM列表序号：'+SGrid.Cells[0,i]+'行。');

          exit;
        end;
      end;

      //xwj增加   Fst=1 增加  (Fst=1) and ( )
       if ADO148_s.Locate('INVENT_PTR;Invent_or',VarArrayOf([Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('rkey').AsInteger,Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('FisMAt').AsInteger]),[]) then
          begin
              showmessage('您添加的物料在此BOM中已经存在....！！');
              exit;
          end;


      if (Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('FisMAt').AsInteger=1) and (Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('rkey').AsInteger=DM.D08RKEY.Value) then
      begin
        showmessage('BOM物料不能选定自己!');
        exit;
      end;

      Edit4.Tag:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('rkey').Value;
      Edit4.Text:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('INV_PART_NUMBER').Value;
      Edit5.Text:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('INV_NAME').Value;
      Edit6.Text:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('INV_DESCRIPTION').Value;
      Edit12.Text:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('STD_cost').asstring;
      Edit13.Text:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('unit_name').asstring;
      Edit10.Tag:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('FisMAt').AsInteger;
//      ShowMessage('1');
      if Edit10.Tag=0 then
      if (Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('STOP_PURCH').AsString='Y')  then
      begin
        Edit15.Text := '是';
      end
      else if (Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('STOP_PURCH').AsString='N')  then
      begin
         Edit15.Text := '否';
      end;
//      if Edit10.Tag=0 then
//        SGrid.Cells[6,iRow]:='材料'
//      else
//        SGrid.Cells[6,iRow]:='半成品';
//      Edit15.Text := Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('STOP_PURCH').AsString;
    end
    else
    begin  //替代料
      if Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('rkey').Value=Edit4.Tag then
      begin
        showmessage('主物料与替代料不能相同!');
        exit;
      end;
      if Edit10.Tag<>Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('FisMAt').AsInteger then
      begin
        showmessage('材料与半成品不能替代!');
        exit;
      end;
      Edit7.Tag:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('rkey').Value;
      Edit7.Text:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('INV_PART_NUMBER').Value;
      Edit8.Text:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('INV_NAME').Value;
      Edit9.Text:=Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('INV_DESCRIPTION').Value;

      if (Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('STOP_PURCH').AsString='Y') then
      begin
        Edit16.Text := '是';
      end
      else if Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('STOP_PURCH').AsString='N' then
      begin
         Edit16.Text := '否';
      end;
//      Edit16.Text := Frm_MatSelect.DBGridEh1.DataSource.DataSet.FieldByName('STOP_PURCH').AsString;
    end;
    Edit10.SetFocus;
  end;

end;

procedure TFrm_BOMEdt.SpeedButton1Click(Sender: TObject);
var
  i: Integer;
begin
  if Edit2.Text='' then
  begin
    showmessage('请输入BOM名称');
    Edit2.SelectAll;
    Edit2.SetFocus;
    exit;
  end;
//  if ADO148_s.IsEmpty then
//  begin
//    showmessage('您不能保存空的记录');
//    exit;
//  end;

  if Ftag=0 then
  begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text:='select top 1 rkey from data0140 where part_name= '+ QuotedStr(Trim(Edit2.Text))
      + ' and part_ptr= ' + DM.D08RKEY.AsString;
    DM.Tmp.Open;

    if not DM.Tmp.IsEmpty then
    begin
      showmessage('BOM名称已经重复,请您更改...');
      Edit2.SelectAll;
      Edit2.SetFocus;
      exit; 
    end;
  end;
  //此处 ，如果是半成品BOM，将来增加半成品 【无限循环调用】的预判代码。by xwj 20141223
    
  if Ftag=0 then ADO140.Append else ADO140.Edit;   //Edit

  for i := SGrid.RowCount - 2 downto 1 do
  begin
    if SGrid.Cells[0, i+1] = SGrid.Cells[0, i+2] then
    begin
      //ShowMessage(SGrid.Cells[0, i+1]);
    end;
  end;
  
  ADO140.FieldByName('part_name').AsString:=Edit2.Text;
  ADO140.FieldByName('part_ptr').AsInteger:=DM.D08RKEY.Value;
  ADO140.FieldByName('status').AsInteger:=0;
//  if Ftag=0 then
//  begin
    ADO140.FieldByName('user3_ptr').AsString:=user_ptr;
    ADO140.FieldByName('auth3_date').Value := getsystem_date(DM.Tmp,0);
//  end;
  ADO140.Post;
  try
    DM.ADOCon.BeginTrans;
    ADO140.UpdateBatch(arAll);
    if Ftag=0 then
    begin
      ADO148_s.First;
      while not ADO148_s.Eof do
      begin
        ADO148_s.Edit;
        ADO148_s.FieldByName('PART_PTR').Value:=ADO140.fieldbyname('rkey').AsInteger;
        ADO148_s.Post;
        ADO148_s.Next;
      end;
    end;
    ADO148_s.UpdateBatch(arAll);
    DM.ADOCon.CommitTrans;
    Frkey140:=ADO140.FieldByName('rkey').AsInteger;
    //重算编号，消除编号断码重码等
    qryADO148_sort.Parameters[0].Value := ADO140.FieldByName('rkey').AsInteger;
    qryADO148_sort.Parameters[1].Value := ADO140.FieldByName('rkey').AsInteger;
    qryADO148_sort.ExecSQL;
    //
    modalresult:=mrok;
  except                                        
    on E: Exception do
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('数据保存发生错误:'+E.Message);
    end;
  end;
end;

procedure TFrm_BOMEdt.BtnAddClick(Sender: TObject);
begin
  if newrownumber = 0 then newrownumber := 1;

   Fst:=1;   //FST=1 新增 ,以前删除掉的 stringgrid数据需要清空一次
  
   if trim(SGrid.Cells[1,SGrid.Row])<>'' then  //点新增的时候，鼠标还放在有数据的行，要清空面板和制定新行。
   begin
      SGrid.RowCount:= SGrid.RowCount+1;
      if SGrid.RowCount >2 then
      SGrid.Row:=SGrid.RowCount-2;  //行标指定新行，新行会有老数据么
      //SGrid.Enabled:=false;
      Edit4.Text:='';
      Edit5.Text:='';
      Edit6.Text:='';
      Edit7.Text:='';
      Edit8.Text:='';
      Edit9.Text:='';
      Edit10.Text:='';
      Edit11.Text:='';     
      Edit12.Text:='';
      Edit13.Text:='';
      ComboBox1.ItemIndex := -1;
      ComboBox2.ItemIndex := -1;
      SGrid.Cells[0,SGrid.Row]:='';//因为前面加了一次。
      SGrid.Cells[1,SGrid.Row]:='';
      SGrid.Cells[2,SGrid.Row]:='';
      SGrid.Cells[3,SGrid.Row]:='';
      SGrid.Cells[4,SGrid.Row]:='';  //BOM NO
      SGrid.Cells[5,SGrid.Row]:='';  //MEmo
      SGrid.Cells[14,SGrid.Row]:='';  //std_cost
      SGrid.Cells[15,SGrid.Row]:='';  //unit_name
      SGrid.Cells[16,SGrid.Row]:='';
      SGrid.Cells[17,SGrid.Row]:='';
      
      SGrid.Cells[6,SGrid.Row]:='';
      SGrid.Cells[7,SGrid.Row]:='';
      SGrid.Cells[8,SGrid.Row]:='';
      SGrid.Cells[9,SGrid.Row]:='';
      SGrid.Cells[10,SGrid.Row]:='';    //invent_ptr
      SGrid.Cells[11,SGrid.Row]:='';   //invent_or
      SGrid.Cells[12,SGrid.Row]:='';   //repl_invt_ptr
      //----SGrid.Cells[17,SGrid.Row]:='';   采购优先级
    end
    else
    begin
           if SGrid.RowCount = 2 then
            begin
              //ShowMessage('全新增');
              SGrid.RowCount:= SGrid.RowCount+1;
              SGrid.Row:=SGrid.RowCount-2;
            end
    end;
  EnbBtns(3);    //各种enable的判断
  SpeedButton3Click(SpeedButton3);
end;

procedure TFrm_BOMEdt.BtnOKClick(Sender: TObject);
var iRow:integer;
begin
//  ShowMessage(IntToStr(newrownumber));
  if Edit4.Text='' then
  begin
    showmessage('物料编码不能为空!');
    Edit4.SetFocus;
    exit;                           
  end;
    if ComboBox1.Text='' then
  begin
    showmessage('采购优先级别不能为空!');
    ComboBox1.SetFocus;
    exit;
  end;

  if trim(Edit10.Text)='' then
  begin
    showmessage('BOM数量不能为空!');
    edit10.SetFocus;
    exit;
  end;

//  if ADO148_s.IsEmpty then
//  begin
//  ShowMessage('请先添加物料!');
//  exit;
//  end;

   if  trim(Edit7.Text)<>'' then
    begin
        if DM.ADOCon.Connected then
        begin
                  DM.Tmp2.Close;
                  DM.Tmp2.SQL.Clear;
                  DM.Tmp2.SQL.Text:='select INV_PART_NUMBER,INV_NAME,INV_PART_DESCRIPTION,CRITICAL_MATL_FLAG from data0017 where INV_PART_NUMBER = '''+trim(Edit7.Text)+'''';
                  DM.Tmp2.Open;
                    if DM.Tmp2.IsEmpty then
                    begin
                          showmessage('您输入的代替物料编码有误，请重新输入！ ');
                          Edit9.Text:='';
                          Edit7.SetFocus;
                          abort;
                    end
                    else
                    begin
                         Edit8.Text:= dm.tmp2.FieldByName('INV_NAME').AsString;
                         Edit9.Text:= dm.tmp2.FieldByName('INV_PART_DESCRIPTION').AsString;
                    end;

        end;
    end;

  //领料后BOM数量控制


  if FSt=0 then  //Edit  编辑
  begin
    irow:=SGrid.Row;
    ADO148_s.Locate('INVENT_PTR;Invent_or',VarArrayOf([strtoint(SGrid.Cells[10,iRow]),strtoint(SGrid.Cells[11,iRow])]),[]);
    ADO148_s.Edit ;
  end
  else
   begin
      {if ADO148_s.Locate('INVENT_PTR;Invent_or',VarArrayOf([DM.Tmp.fieldbyname('INVENT_PTR').Value,DM.Tmp.fieldbyname('Invent_or').Value]),[]) then
          begin
            DM.Tmp.Next;
            continue;
          end;}

    //此处应该提示，是否已经存在这个物料
    ADO148_s.Append;
    //此处应该提示，是否已经存在这个物料
    ADO148_s.FieldByName('seq_no').Value:= newrownumber;

    inc(newrownumber);

    irow:=SGrid.RowCount-2;    //新增到倒数第二行

  end;

  if (Ftag=1) and (FSt=1) then
    ADO148_s.FieldByName('PART_PTR').Value:=ADO140.fieldbyname('rkey').AsInteger;

  ADO148_s.FieldByName('INVENT_PTR').Value:=Edit4.tag;
  if Edit7.Text<>'' then
  ADO148_s.FieldByName('repl_invt_ptr').Value:=Edit7.tag;
  if Edit7.Text='' then
  ADO148_s.FieldByName('repl_invt_ptr').Value:=null;

  ADO148_s.FieldByName('QUAN_BOM').Value:=strtofloat(Trim(Edit10.Text));
  if (Trim(Edit12.Text)='') then Edit12.Text:='0';
  ADO148_s.FieldByName('std_cost').Value:=strtofloat(Edit12.Text);
  ADO148_s.FieldByName('VENDOR').Value:=Edit11.Text;
  ADO148_s.FieldByName('Invent_or').Value:=Edit10.Tag;
  if ComboBox1.Text<>'' then
  ADO148_s.FieldByName('p_code').Value:=StrToInt(ComboBox1.Text);
  if ComboBox2.Text<>'' then
  ADO148_s.FieldByName('production_teamname').Value := ComboBox2.Text;
  
  ADO148_s.Post;
     //这里在编辑的时候好像有BUG
  if FSt=1 then  SGrid.Cells[0,iRow]:=IntToStr(newrownumber-1);//因为前面加了一次。
  SGrid.Cells[1,iRow]:=Edit4.Text;
  SGrid.Cells[2,iRow]:=Edit5.Text;
  SGrid.Cells[3,iRow]:=Edit6.Text;
  SGrid.Cells[4,iRow]:=Trim(Edit10.Text);  //BOM NO
  SGrid.Cells[5,iRow]:=Edit11.Text;  //MEmo
  SGrid.Cells[14,iRow]:=Edit12.Text;  //std_cost
//  SGrid.Cells[15,iRow]:=Edit13.Text;  //unit_name
//  SGrid.Cells[16,iRow]:= IntToStr(ZYtag);
//  SGrid.Cells[17,iRow]:= ComboBox1.Text;
//  SGrid.Cells[18,iRow]:= ComboBox2.Text;
//  SGrid.Cells[19,iRow]:= Edit15.Text;
//  SGrid.Cells[20,iRow]:=Edit16.Text;

  SGrid.Cells[16,iRow]:= Edit13.Text;
  SGrid.Cells[17,iRow]:= ComboBox1.Text;
  SGrid.Cells[18,iRow]:=Edit15.Text;
  SGrid.Cells[19,iRow]:=  ComboBox2.Text;
  SGrid.Cells[20,iRow]:=Edit16.Text;


  if Edit10.Tag=0 then
    SGrid.Cells[6,iRow]:='材料'
  else
    SGrid.Cells[6,iRow]:='半成品';

  SGrid.Cells[7,iRow]:=Edit7.Text;
  SGrid.Cells[8,iRow]:=Edit8.Text;
  SGrid.Cells[9,iRow]:=Edit9.Text;

  SGrid.Cells[10,iRow]:=inttostr(Edit4.tag);    //invent_ptr
  SGrid.Cells[11,iRow]:=inttostr(Edit10.tag);   //invent_or
  SGrid.Cells[12,iRow]:=inttostr(Edit7.tag);   //repl_invt_ptr

  EnbBtns(1);
  FSt:=0;
end;

procedure TFrm_BOMEdt.BtnDelClick(Sender: TObject);
var
 i,ARow,k:integer;
begin
  if SGrid.RowCount <= 2 then exit;
  if ADO148_s.Locate('INVENT_PTR;Invent_or',VarArrayOf([Edit4.tag,Edit10.Tag]),[]) then
  begin
    if GetFL(ADO148_s.fieldbyname('rkey').AsInteger) then
    begin
      showmessage('此物料已产生领料单,不能删除...');
      exit;
    end;
    ADO148_s.delete;
    newrownumber := newrownumber-1;
    //此处需要函数调整GGRID和ADO_S
  end;

  for i:=SGrid.Row to SGrid.RowCount-2 do sgrid.Rows[i].Text:=SGrid.Rows[i+1].Text;
  SGrid.RowCount:=SGrid.RowCount-1;

  if SGrid.Row=1 then ARow:=1 else ARow:=SGrid.Row-1;
  SGrid.Row:=ARow;

  Edit4.Text:=SGrid.Cells[1,ARow];
  Edit5.Text:=SGrid.Cells[2,ARow];
  Edit6.Text:=SGrid.Cells[3,ARow];
  Edit7.Text:=SGrid.Cells[7,ARow];
  Edit8.Text:=SGrid.Cells[8,ARow];
  Edit9.Text:=SGrid.Cells[9,ARow];

  Edit10.Text:=SGrid.Cells[4,ARow];
  Edit11.Text:=SGrid.Cells[5,ARow];
  Edit12.Text:=SGrid.Cells[14,ARow];
  Edit13.Text:=SGrid.Cells[16,ARow];

  if TryStrToInt(SGrid.Cells[17,ARow],k)
   then  ComboBox1.ItemIndex:=StrToInt(SGrid.Cells[17,ARow])-1
   else ComboBox1.ItemIndex := -1 ;


     if  SGrid.Cells[19,ARow]<>''
   then   combobox2.ItemIndex := combobox2.Items.IndexOf(SGrid.Cells[19,ARow])
   // ComboBox2.Text:= SGrid.Cells[18,ARow]
   else ComboBox2.ItemIndex := -1 ;

  if trim(SGrid.Cells[10,ARow])<>'' then
  begin
    Edit4.Tag:=strtoint(SGrid.Cells[10,ARow]);
    Edit10.Tag:=strtoint(SGrid.Cells[11,ARow]);
  end;
  if trim(SGrid.Cells[12,ARow])<>'' then
  begin
    Edit7.tag:=strtoint(SGrid.Cells[12,ARow]);
  end;
  EnbBtns(1);
end;

procedure TFrm_BOMEdt.SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
  var k: Integer;
begin
    CanSelect:=ARow<>SGrid.RowCount-1;
    if not CanSelect then exit;
    Edit4.Text:=SGrid.Cells[1,ARow];
    Edit5.Text:=SGrid.Cells[2,ARow];
    Edit6.Text:=SGrid.Cells[3,ARow];

    Edit7.Text:=SGrid.Cells[7,ARow];
    Edit8.Text:=SGrid.Cells[8,ARow];
    Edit9.Text:=SGrid.Cells[9,ARow];
    Edit10.Text:=SGrid.Cells[4,ARow];
    Edit11.Text:=SGrid.Cells[5,ARow];
    Edit12.Text:=SGrid.Cells[14,ARow];

    Edit13.Text:=SGrid.Cells[16,ARow];
    Edit15.Text := SGrid.Cells[18,ARow];
    Edit16.Text := SGrid.Cells[20,ARow];

    if  TryStrToInt( SGrid.Cells[17,ARow],k)
    then    ComboBox1.ItemIndex := StrToInt(SGrid.Cells[17,ARow])-1
    else   ComboBox1.ItemIndex := -1 ;

    if  SGrid.Cells[19,ARow]<>''
   then    ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(SGrid.Cells[19,ARow])
   else ComboBox2.ItemIndex := -1 ;

    if trim(SGrid.Cells[10,ARow])<>'' then
    begin
      Edit4.Tag:=strtoint(SGrid.Cells[10,ARow]);
      Edit10.Tag:=strtoint(SGrid.Cells[11,ARow]);
    end;

    if trim(SGrid.Cells[12,ARow])<>'' then
    begin
      Edit7.tag:=strtoint(SGrid.Cells[12,ARow]);
    end;
end;

function TFrm_BOMEdt.GetFL(rkey148: integer): boolean;
begin
  result:= False;
  DM.Tmp.Close;

//   DM.Tmp.SQL.Text := 'select rkey from dbo.wzcp0492 where (D148_PTR =' + inttostr(rkey148)
//   + ' )and ((App_QTY>0)or(Con_QTY>0)or(QUAN_ASSIGN>0))';

//20160804tang修改：没申领完标准数量之前允许替代物料
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='SELECT sum(QUAN_ISSUED) as SL from Data0468 where bom_list_ptr='
    +inttostr(rkey148) + ' and INVENT_PTR =' + inttostr(edit4.tag);
  DM.Tmp.Open;
  if  DM.Tmp.fieldbyname('SL').asstring<>'' then
  begin
   // if ((dm.Tmp.FieldByName('SL').AsFloat)>=StrToFloat(Trim(Edit10.Text))) then  //
    result:= True;
  end;

 // ShowMessage(DM.Tmp.SQL.Text);
//  DM.Tmp.Open;
//  if not DM.Tmp.IsEmpty then
//    result:= True;
 { DM.Tmp.Close;
  DM.Tmp.SQL.Text:='SELECT QUAN_ISSUED from Data0468 where bom_list_ptr='
    +inttostr(rkey148) + ' and INVENT_PTR =' + inttostr(edit4.tag);
  DM.Tmp.Open;
  result:= (DM.Tmp.FieldByName('QUAN_ISSUED').Value > 0);    }
end;

procedure TFrm_BOMEdt.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then abort;
end;

procedure TFrm_BOMEdt.EnbBtns(st: integer);
begin               //1 Browse 2 edit 3 Add
     BtnAdd.Enabled:=st=1;
    BtnEdit.Enabled:=(st=1) and (SGrid.RowCount>2);
  BtnCancel.Enabled:=(st=2) or (st=3);
     BtnDel.Enabled:=BtnEdit.Enabled;
      BtnOK.Enabled:=(st=2) or (st=3);
      BtnIn.Enabled:=st=1;
      SpeedButton5.Enabled :=st=1;
      Edit7.Enabled := (st=2) or (st=3);
      Edit8.Enabled := (st=2) or (st=3);
      Edit9.Enabled := (st=2) or (st=3);
      SGrid.Enabled:=st=1;
  SpeedButton3.Enabled:=BtnCancel.Enabled;
  if (Edit10.Tag=1) then SpeedButton4.Enabled:=False else
  SpeedButton4.Enabled:=SpeedButton3.Enabled;
  Edit10.Enabled:=SpeedButton3.Enabled;
  ComboBox1.Enabled:=SpeedButton3.Enabled;
  ComboBox2.Enabled:=SpeedButton3.Enabled;

  Edit11.Enabled:=SpeedButton3.Enabled;
end;

procedure TFrm_BOMEdt.BtnEditClick(Sender: TObject);
begin
if trim(SGrid.Cells[1,SGrid.Row])='' then  //add 取消
 begin
    FSt:=1; 
 end;
 EnbBtns(2);
end;

procedure TFrm_BOMEdt.BtnCancelClick(Sender: TObject);
var arow,k : Integer;
begin
 if trim(SGrid.Cells[1,SGrid.Row])='' then  //add 取消
 begin
    //ShowMessage(IntToStr(ADO148_s.RecordCount));
    //重新定位
    arow :=  SGrid.Row;//记录当前行标
    //arow := arow-1;
    SGrid.RowCount:=SGrid.RowCount-1;    //行尾减1

    if SGrid.Row=1 then ARow:=1 else ARow:=SGrid.Row-1;

    SGrid.Row:=ARow;  //定位到上一行

    Edit4.Text:=SGrid.Cells[1,ARow];
    Edit5.Text:=SGrid.Cells[2,ARow];
    Edit6.Text:=SGrid.Cells[3,ARow];
    Edit7.Text:=SGrid.Cells[7,ARow];
    Edit8.Text:=SGrid.Cells[8,ARow];
    Edit9.Text:=SGrid.Cells[9,ARow];

    Edit10.Text:=SGrid.Cells[4,ARow];
    Edit11.Text:=SGrid.Cells[5,ARow];
    Edit12.Text:=SGrid.Cells[14,ARow];
    Edit13.Text:=SGrid.Cells[16,ARow];
    Edit15.Text:=SGrid.Cells[18,ARow];

    if   TryStrToInt(SGrid.Cells[17,SGrid.Row],k)
    then  ComboBox1.ItemIndex := StrToInt(SGrid.Cells[17,SGrid.Row])-1
    else ComboBox1.ItemIndex := -1;

    if    SGrid.Cells[19,SGrid.Row]<>''
    then combobox2.ItemIndex := combobox2.Items.IndexOf(SGrid.Cells[19,SGrid.Row])
    //ComboBox2.Text :=  SGrid.Cells[18,ARow]
    else ComboBox2.ItemIndex := -1;

    //重新定位
    if trim(SGrid.Cells[10,ARow])<>'' then
    begin
    Edit4.Tag:=strtoint(SGrid.Cells[10,ARow]);
    Edit10.Tag:=strtoint(SGrid.Cells[11,ARow]);
    end;
    if trim(SGrid.Cells[12,ARow])<>'' then
    begin
    Edit7.tag:=strtoint(SGrid.Cells[12,ARow]);
    end;
    
    EnbBtns(1);
    ShowMessage('添加取消');
   // ShowMessage(IntToStr(ADO148_s.RecordCount));
 end
 else
 begin
    Edit4.Text:=SGrid.Cells[1,SGrid.Row];
    Edit5.Text:=SGrid.Cells[2,SGrid.Row];
    Edit6.Text:=SGrid.Cells[3,SGrid.Row];

    Edit7.Text:=SGrid.Cells[7,SGrid.Row];
    Edit8.Text:=SGrid.Cells[8,SGrid.Row];
    Edit9.Text:=SGrid.Cells[9,SGrid.Row];
    Edit10.Text:=SGrid.Cells[4,SGrid.Row];
    Edit11.Text:=SGrid.Cells[5,SGrid.Row];
    Edit12.Text:=SGrid.Cells[14,SGrid.Row];
    Edit13.Text:=SGrid.Cells[16,SGrid.Row];
    Edit15.Text:=SGrid.Cells[18,SGrid.Row];


    if   TryStrToInt(SGrid.Cells[17,SGrid.Row],k)
     then ComboBox1.ItemIndex := StrToInt(SGrid.Cells[17,SGrid.Row])-1
     else ComboBox1.ItemIndex := -1;

         if    SGrid.Cells[19,SGrid.Row]<>''
    then  combobox2.ItemIndex := combobox2.Items.IndexOf(SGrid.Cells[19,SGrid.Row])
    //ComboBox2.Text :=  SGrid.Cells[18,ARow]
    else ComboBox2.ItemIndex := -1;
    //ComboBox1.Text:= SGrid.Cells[17,SGrid.Row] ;

    Edit4.Tag:=strtoint(SGrid.Cells[10,SGrid.Row]);
    Edit10.Tag:=strtoint(SGrid.Cells[11,SGrid.Row]);
    if  SGrid.Cells[12,SGrid.Row]<>'' then
    Edit7.tag:=strtoint(SGrid.Cells[12,SGrid.Row]);

    EnbBtns(1);
 end;
end;

procedure TFrm_BOMEdt.BtnInClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  s,irow,k:integer;
  b:boolean;
  alarm_char :string;
begin
  //ShowMessage(IntToStr(newrownumber));
  if Edit2.Text='' then
  begin
    showmessage('请先输入BOM名称!');
    exit;
  end;
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'PROD_CODE/产品编码/90,PRODUCT_NAME/产品名称/120,part_name/BOM名称/100,PRODUCT_DESC/产品规格/120,ttype_c/类别/50';
    InputVar.Sqlstr :=  'SELECT  dbo.Data0008.*,data0140.rkey as rkey140,data0140.part_name, dbo.Data0007.PR_GRP_CODE,'+#13
                        +'dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME,' +#13
                        +'case when data0008.ttype=0 then ''半成品''  else ''成品'' end ttype_c'+#13
                        +'FROM  dbo.Data0008 inner join data0140 on data0008.rkey=data0140.part_ptr INNER JOIN'+#13
                        +'dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.Data0007.RKEY INNER JOIN'+#13
                        +'dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY '+#13
                        +'where Data0008.PROD_CODE<>'+QuotedStr(Edit1.Text);
    inputvar.KeyField:='PROD_CODE';
    // ShowMessage(InputVar.Sqlstr);
    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar) ;

    if frmPick_Item_Single.ShowModal=mrok then
    begin
       DM.Tmp.Close;
       DM.Tmp.SQL.Text:='SELECT data0148.rkey,data0148.PART_PTR,data0148.INVENT_PTR,'+
        'data0148.repl_invt_ptr,data0148.QUAN_BOM,data0148.VENDOR,data0148.Invent_or,'+
        'data0148.STD_COST,data0148.seq_no,data0148.P_CODE,data0148.production_teamname,d17_0.STD_COST as STD_COST17,'+
        'case when data0148.invent_or=0 then ''材料'' else ''半成品'' end invent_tp,'+
        'd17_0.inv_part_number,d17_0.inv_name,d17_0.INV_DESCRIPTION,'+
        'case when d17_0.STOP_PURCH=''Y'' then ''是'' when d17_0.STOP_PURCH=''N'' then ''否'' else '''' end as STOP_PURCH, '+
        'case when d17_1.STOP_PURCH=''Y'' then ''是'' when d17_1.STOP_PURCH=''N'' then ''否'' else '''' end as STOP_PURCH1,' +
        'd17_1.inv_part_number inv_part_number_r ,d17_1.inv_name inv_name_r,d17_1.INV_DESCRIPTION INV_DESCRIPTION_r,d02.unit_name '+
        'FROM dbo.DATA0148 inner join data0017 d17_0 on data0148.invent_ptr=d17_0.rkey inner join data0002 d02 on d17_0.STOCK_UNIT_PTR=d02.rkey '+
         'left join data0017 d17_1 on data0148.repl_invt_ptr=d17_1.rkey '+
        'where data0148.invent_or=0 and data0148.part_ptr='+frmPick_Item_Single.adsPick1.FieldByName('rkey140').AsString+
        'union all '+
        'SELECT data0148.rkey,data0148.PART_PTR,data0148.INVENT_PTR,'+
        'data0148.repl_invt_ptr,data0148.QUAN_BOM,data0148.VENDOR,data0148.Invent_or,'+
        'data0148.STD_COST,data0148.seq_no,data0148.P_CODE ,data0148.production_teamname,d08_0.new_price as STD_COST17,'+
        'case when data0148.invent_or=0 then ''材料'' else ''半成品'' end invent_tp,'+
        'd08_0.PROD_CODE inv_part_number,d08_0.PRODUCT_NAME inv_name,d08_0.PRODUCT_DESC INV_DESCRIPTION,'+
        'null as STOP_PURCH,null as STOP_PURCH1,'+
        'd08_1.PROD_CODE inv_part_number_r ,d08_1.PRODUCT_NAME inv_name_r,d08_1.PRODUCT_DESC INV_DESCRIPTION_r,d02.unit_name '+
        'FROM dbo.DATA0148 inner join data0008 d08_0 on data0148.invent_ptr=d08_0.rkey inner join data0002 d02 on d08_0.unit_ptr=d02.rkey '+
        'left join data0008 d08_1 on data0148.repl_invt_ptr=d08_1.rkey '+
        'where data0148.invent_or=1 and data0148.part_ptr='+frmPick_Item_Single.adsPick1.FieldByName('rkey140').AsString+
        'order by data0148.rkey';

       DM.Tmp.Open;
       irow:=SGrid.RowCount-1;   //目标行就是最后一行  ，不同于单添加，这里是导入添加
       b:=false;

       while not DM.Tmp.Eof do
        begin
          //此处是在AD0148里找，STRINGGRID没提交之前会定位不呢
          if ADO148_s.Locate('INVENT_PTR;Invent_or',VarArrayOf([DM.Tmp.fieldbyname('INVENT_PTR').Value,DM.Tmp.fieldbyname('Invent_or').Value]),[]) then
          begin
            //提示是否累加，如果是就加不是就不做操作
            //累加完之后，需要把stringgrid行标定位到最后一行  ？ 可能不需要。
            alarm_char:=DM.Tmp.fieldbyname('inv_name').asstring+' '+DM.Tmp.fieldbyname('inv_part_number').asstring+#13+
            '规格:['+DM.Tmp.fieldbyname('INV_DESCRIPTION').asstring+']'+#13+#13+
            '  [物料已存在]'+#13+'新增需求数量为：'
            +DM.Tmp.fieldbyname('QUAN_BOM').asstring+DM.Tmp.fieldbyname('unit_name').asstring+#13+' 需要追加物料吗？'+#13+
            '原物料BOM数量为:'+ado148_s.fieldbyname('QUAN_BOM').AsString+DM.Tmp.fieldbyname('unit_name').asstring;
            s:=messagebox(Self.Handle,PAnsiChar(AnsiString(alarm_char)),'询问',MB_YESNO+MB_iconquestion) ;
            if S = idyes  then
            begin
              //ShowMessage('追加物料需求数');
              for k:=0 to SGrid.RowCount-1   do
              begin
                 if (SGrid.Cells[10,k]= DM.Tmp.fieldbyname('invent_ptr').AsString) and
                    (SGrid.Cells[11,k]= DM.Tmp.fieldbyname('invent_or').AsString)
                    then
                    begin
                     SGrid.Cells[4,k] := FloatToStr(DM.Tmp.fieldbyname('QUAN_BOM').AsFloat+ado148_s.fieldbyname('QUAN_BOM').AsFloat);
                     ADO148_s.Edit;
                     ado148_s.fieldbyname('QUAN_BOM').Value := StrToFloat(SGrid.Cells[4,k]);
                     ADO148_s.Post;
                     Break;
                    end;
              end;
            end
            else
           ShowMessage('不需增加，保存现BOM需求数');

            DM.Tmp.Next;
            continue;
          end;
          try
            ADO148_s.Append;
            if (Ftag=1)  then   //and (FSt=1)
              ADO148_s.FieldByName('PART_PTR').Value:=ADO140.fieldbyname('rkey').AsInteger;
             if newrownumber =0  then  newrownumber :=1;
            ADO148_s.FieldByName('seq_no').Value:=newrownumber;
            ADO148_s.FieldByName('INVENT_PTR').Value:=DM.Tmp.fieldbyname('INVENT_PTR').Value;
            ADO148_s.FieldByName('repl_invt_ptr').Value:=DM.Tmp.fieldbyname('repl_invt_ptr').Value;
            ADO148_s.FieldByName('QUAN_BOM').Value:=DM.Tmp.fieldbyname('QUAN_BOM').Value;
            ADO148_s.FieldByName('std_cost').Value:=DM.Tmp.fieldbyname('std_cost17').Value;
            ADO148_s.FieldByName('VENDOR').Value:=DM.Tmp.fieldbyname('VENDOR').Value;
            ADO148_s.FieldByName('Invent_or').Value:=DM.Tmp.fieldbyname('Invent_or').Value;
            ADO148_s.FieldByName('p_code').Value:=DM.Tmp.fieldbyname('p_code').Value;
            ADO148_s.FieldByName('production_teamname').Value:=DM.Tmp.fieldbyname('production_teamname').Value;
            ADO148_s.Post;
          except
            on E: Exception do
            begin
              DM.ADOCon.RollbackTrans;
              showmessage('数据添加发生错误:可能材料没有类型。具体错误为：'+E.Message);
            end;
          end;
          SGrid.RowCount:=SGrid.RowCount+1;
          SGrid.Cells[0,iRow]:=IntToStr(newrownumber);
          SGrid.Cells[1,iRow]:=DM.Tmp.FieldValues['inv_part_number'];
          SGrid.Cells[2,iRow]:=DM.Tmp.fieldbyname('inv_name').Value;
          SGrid.Cells[3,iRow]:=DM.Tmp.fieldbyname('INV_DESCRIPTION').Value;
          SGrid.Cells[4,iRow]:=DM.Tmp.fieldbyname('QUAN_BOM').Value;  //BOM NO
          SGrid.Cells[5,iRow]:=DM.Tmp.fieldbyname('VENDOR').Value;    //MEmo
          SGrid.Cells[14,iRow]:=DM.Tmp.fieldbyname('std_cost17').Value;  //std_cost
          SGrid.Cells[16,iRow]:=   DM.Tmp.fieldbyname('unit_name').Value; //unit_name
          if  DM.Tmp.fieldbyname('p_code').AsString<>''
          then SGrid.Cells[17,iRow]:= DM.Tmp.fieldbyname('p_code').AsString;

          if  DM.Tmp.fieldbyname('production_teamname').AsString<>''
          then SGrid.Cells[19,iRow]:= DM.Tmp.fieldbyname('production_teamname').AsString;

          //ComboBox1.Text := DM.Tmp.fieldbyname('p_code').AsString;
          SGrid.Cells[18,iRow]:=DM.Tmp.fieldbyname('STOP_PURCH').AsString;
          SGrid.Cells[20,iRow]:=DM.Tmp.fieldbyname('STOP_PURCH1').AsString;

          SGrid.Cells[6,iRow]:=DM.Tmp.fieldbyname('Invent_tp').AsString;
          SGrid.Cells[7,iRow]:=DM.Tmp.fieldbyname('inv_part_number_r').AsString;
          SGrid.Cells[8,iRow]:=DM.Tmp.fieldbyname('inv_name_r').AsString;
          SGrid.Cells[9,iRow]:=DM.Tmp.fieldbyname('INV_DESCRIPTION_r').AsString;

          SGrid.Cells[10,iRow]:=DM.Tmp.fieldbyname('invent_ptr').AsString;    //invent_ptr
          SGrid.Cells[11,iRow]:=DM.Tmp.fieldbyname('invent_or').AsString;    //invent_or
          SGrid.Cells[12,iRow]:=DM.Tmp.fieldbyname('repl_invt_ptr').AsString;   //repl_invt_ptr
          inc(irow);
          Inc(newrownumber);
          DM.Tmp.Next;
          if not b then
          begin
            b:=true;
            SGridSelectCell(SGrid, 0, iRow, b);
            EnbBtns(1);
          end;

        end;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrm_BOMEdt.Edit7Exit(Sender: TObject);
begin

    if  Edit7.Text=''
    then
    begin
      Edit8.Text :='';
      Edit9.Text :=''
    end;
   {if  Edit7.Text<>'' then
    begin
        if DM.ADOCon.Connected then
        begin
                  DM.Tmp2.Close;
                  DM.Tmp2.SQL.Clear;
                  DM.Tmp2.SQL.Text:='select INV_PART_NUMBER,INV_NAME,INV_DESCRIPTION,INV_PART_DESCRIPTION from data0017 where INV_PART_NUMBER = '''+trim(Edit7.Text)+'''';
                  DM.Tmp2.Open;
                    if DM.Tmp2.IsEmpty then
                    begin
                          showmessage('您输入的代替物料编码有误，请重新输入');
                          Edit8.Text:='';
                          Edit9.Text:='';
                          Edit7.SetFocus;
                          abort;
                    end else begin
                         Edit8.Text:= dm.tmp2.FieldByName('INV_NAME').AsString;
                         //Edit9.Text:= dm.tmp2.FieldByName('INV_PART_DESCRIPTION').AsString;
                         Edit9.Text:= dm.tmp2.FieldByName('INV_DESCRIPTION').AsString;
                    end;
        end;
    end;}

end;

procedure TFrm_BOMEdt.Edit4Change(Sender: TObject);
begin
  with Dm.Tmp1 do
  begin
    SQL.Text := Format('select CRITICAL_MATL_FLAG from data0017 where inv_part_number=''%s'' ', [Edit4.Text]);
    Open;
    if not IsEmpty then
      ZYtag := FieldValues['CRITICAL_MATL_FLAG'];
  end;
  OutputDebugString(PChar(inttostr( ZYtag)));
end;

procedure TFrm_BOMEdt.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  nrct: TRect;
begin
  with SGrid do
  with Canvas do
  begin
    nrct.TopLeft.X:=Rect.TopLeft.X+1;
    nrct.TopLeft.Y:=Rect.TopLeft.Y+1;
    nrct.BottomRight:=Rect.BottomRight;
    if Cells[15, ARow] = '1' then
    begin
      Font.Color := clRed;
      DrawText(Handle,PChar(Cells[ACol, ARow]),Length(Cells[ACol, ARow]),nrct,DT_LEFT OR DT_SINGLELINE);
    end;
  end;
  if SGrid.Cells[19,ARow] = '是' then
  begin
//  SGrid.Canvas.Brush.Color :=clBlue;
//  SGrid.Canvas.FillRect(rect);
    SGrid.Canvas.Font.Color := clBlue;
    SGrid.Canvas.TextOut(Rect.Left+2,Rect.Top+2,SGrid.Cells[acol,ARow]);

  end;
end;

procedure TFrm_BOMEdt.bbt_1Click(Sender: TObject);
begin
    common.Export_Grid_to_Excel(SGrid,'BOM明细',True);
end;

procedure TFrm_BOMEdt.SpeedButton5Click(Sender: TObject);  //报价材料导入
var
  InputVar: PDlgInput;
  s,irow,k:integer;
  b:boolean;
  alarm_char :string;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'PROD_CODE/产品编码/90,PRODUCT_NAME/产品名称/120,part_name/报价分类名称/100,PRODUCT_DESC/产品规格/120,ttype_c/类别/50';
    InputVar.Sqlstr :=  'SELECT  dbo.Data0008.*,WZCP0140.rkey as rkey140,WZCP0140.part_name, dbo.Data0007.PR_GRP_CODE,'+#13
                        +'dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME,' +#13
                        +'case when data0008.ttype=0 then ''半成品''  else ''成品'' end ttype_c'+#13
                        +'FROM  dbo.Data0008 inner join WZCP0140 on data0008.rkey=WZCP0140.part_ptr INNER JOIN'+#13
                        +'dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.Data0007.RKEY INNER JOIN'+#13
                        +'dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY '+#13
                        +'where WZCP0140.status=1 ';//+ QuotedStr(Edit2.Text);
    inputvar.KeyField:='PROD_CODE';
    InputVar.AdoConn:= DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
       if Edit2.Text = '' then Edit2.Text:= frmPick_Item_Single.adsPick1.FieldByName('part_name').AsString;
       DM.Tmp.Close;
       DM.Tmp.SQL.Text:='SELECT WZCP0148.* , d17.STD_COST as STD_COST17,'+
        'case when d17.STOP_PURCH=''Y'' then ''是'' when d17.STOP_PURCH=''N'' then ''否'' else '''' end as STOP_PURCH, '+
        'd17.inv_part_number,d17.inv_name,d17.INV_DESCRIPTION,d02.unit_name '+
        'FROM dbo.WZCP0148 inner join data0017 d17 on WZCP0148.invent_ptr=d17.rkey inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey '+
       //  'left join data0017 d17_1 on data0148.invent_ptr=d17_1.rkey '+   //夫替代料rkey
        'where WZCP0148.rkey_cp140='+frmPick_Item_Single.adsPick1.FieldByName('rkey140').AsString;
       DM.Tmp.Open;
       irow:=SGrid.RowCount-1; //最后一行
       b:=false;
       while not DM.Tmp.Eof do
        begin
          if ADO148_s.Locate('INVENT_PTR;Invent_or',VarArrayOf([DM.Tmp.fieldbyname('INVENT_PTR').Value,0]),[]) then
          begin
            //提示是否累加，如果是就加不是就不做操作
            //累加完之后，需要把stringgrid行标定位到最后一行  ？ 可能不需要。
            alarm_char:= DM.Tmp.fieldbyname('inv_name').asstring+' '+DM.Tmp.fieldbyname('inv_part_number').asstring+#13+
            '规格:['+DM.Tmp.fieldbyname('INV_DESCRIPTION').asstring+']'+#13+#13+
            ' [物料已存在]'+#13 +
            '新增需求数量为：'+
             DM.Tmp.fieldbyname('QUAN_BOM').asstring+DM.Tmp.fieldbyname('unit_name').asstring+#13+'  需要追加物料吗？'+#13+
            '原物料BOM数量为:'+ado148_s.fieldbyname('QUAN_BOM').AsString+DM.Tmp.fieldbyname('unit_name').asstring;
            s:=messagebox(Self.Handle,PAnsiChar(AnsiString(alarm_char)),'询问',MB_YESNO+MB_iconquestion) ;

            if S = idyes  then
            begin
              //ShowMessage('追加物料需求数');
              for k:=0 to SGrid.RowCount-1   do
              begin
                 if (SGrid.Cells[10,k]= DM.Tmp.fieldbyname('invent_ptr').AsString) and
                    (SGrid.Cells[11,k]= '0')
                    then
                    begin
                     SGrid.Cells[4,k] := FloatToStr(DM.Tmp.fieldbyname('QUAN_BOM').AsFloat+ado148_s.fieldbyname('QUAN_BOM').AsFloat);
                     ADO148_s.Edit;
                     ado148_s.fieldbyname('QUAN_BOM').Value := StrToFloat(SGrid.Cells[4,k]);
                     ADO148_s.Post;
                     Break;
                    end;
              end;
            end
            else   ShowMessage('不需增加，保存现BOM需求数');
            DM.Tmp.Next;
            continue;
          end;
          ADO148_s.Append;
          if (Ftag=1)  then   //and (FSt=1)
          ADO148_s.FieldByName('PART_PTR').Value:=ADO140.fieldbyname('rkey').AsInteger;
          ADO148_s.FieldByName('seq_no').Value:=newrownumber;
          ADO148_s.FieldByName('INVENT_PTR').Value:=DM.Tmp.fieldbyname('INVENT_PTR').Value;
          ADO148_s.FieldByName('QUAN_BOM').Value:=DM.Tmp.fieldbyname('QUAN_BOM').Value;
          ADO148_s.FieldByName('std_cost').Value:=DM.Tmp.fieldbyname('std_cost17').Value;
          ADO148_s.FieldByName('VENDOR').Value:=DM.Tmp.fieldbyname('VENDOR').Value;
          ADO148_s.FieldByName('Invent_or').Value:=0;
          ADO148_s.Post;

          SGrid.RowCount:=SGrid.RowCount+1;
          SGrid.Cells[0,iRow]:=IntToStr(newrownumber);
          SGrid.Cells[1,iRow]:=DM.Tmp.FieldValues['inv_part_number'];
          SGrid.Cells[2,iRow]:=DM.Tmp.fieldbyname('inv_name').Value;
          SGrid.Cells[3,iRow]:=DM.Tmp.fieldbyname('INV_DESCRIPTION').Value;
          SGrid.Cells[4,iRow]:=DM.Tmp.fieldbyname('QUAN_BOM').Value;  //BOM NO
          SGrid.Cells[5,iRow]:=DM.Tmp.fieldbyname('VENDOR').Value;    //MEmo
          SGrid.Cells[14,iRow]:=DM.Tmp.fieldbyname('std_cost17').Value;  //std_cost
          SGrid.Cells[16,iRow]:=DM.Tmp.fieldbyname('unit_name').Value; //unit_name
          SGrid.Cells[6,iRow]:='材料';
          SGrid.Cells[10,iRow]:=DM.Tmp.fieldbyname('invent_ptr').AsString;    //invent_ptr
          SGrid.Cells[11,iRow]:='0';    //invent_or
          SGrid.Cells[18,iRow]:=DM.Tmp.fieldbyname('STOP_PURCH').AsString;

          //SGrid.Cells[17,iRow]:=DM.Tmp.fieldbyname('p_code').AsString;
         // SGrid.Cells[19,iRow]:=DM.Tmp.fieldbyname('production_teamname').AsString;

          inc(irow);
          Inc(newrownumber);
          DM.Tmp.Next;
          if not b then
          begin
            b:=true;
            SGridSelectCell(SGrid, 0, iRow, b);
            EnbBtns(1);
          end;

        end;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrm_BOMEdt.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to SGrid.RowCount - 1 do
  begin
    if SGrid.Cells[1, i + 1] = Trim(Edit14.Text) then
    begin
      SGrid.Row := i+1;
      Break;
    end;
  end;
end;

procedure TFrm_BOMEdt.N4Click(Sender: TObject);
begin
  Edit7.Tag := -1;
  Edit7.Clear;
  Edit8.Clear;
  Edit9.Clear;
  SGrid.Cells[7,SGrid.Row] := '';
  SGrid.Cells[8,SGrid.Row] := '';
  SGrid.Cells[9,SGrid.Row] := '';
end;

procedure TFrm_BOMEdt.SGridDblClick(Sender: TObject);
var
  ACol, ARow,xh :Integer;
  Rect:TGridRect;
  s:string;
begin
  with  Sender as TStringGrid   do
  begin
      ARow :=(Sender as TStringGrid).Row ;
      ACol :=(Sender as TStringGrid).Col ;
      SGrid.Options:=   SGrid.Options   -   [goRowSelect];
      if (ACol = 0)  then
      begin
            Rect.Left:= 0;
            Rect.Right:=0;
            Rect.Top:= ARow;
            Rect.Bottom:= ARow;
            SGrid.Options :=   SGrid.Options   +   [goEditing];
            SGrid.Selection := Rect;
           if InputQuery('修改序号', '原序号'+SGrid.Cells[0,ARow]+' 修改为新序号', s)  then
              begin
                if not TryStrToInt(s,xh) then
                begin
                  Abort;
                  ShowMessage('请输入数值');
                end
                else
                begin
                    SGrid.Cells[0,ARow] := s;
                    Fst := 0 ;
                    ADO148_s.Locate('INVENT_PTR;Invent_or',VarArrayOf([strtoint(SGrid.Cells[10,ARow]),strtoint(SGrid.Cells[11,ARow])]),[]);
                    ADO148_s.Edit ;
                    ADO148_s.FieldByName('seq_no').Value:=xh;
                    ADO148_s.post;
                end;
                end;
     end
     else
     begin
      SGrid.Options:=   SGrid.Options  -   [goEditing];
     end;
     //SGrid.CellRect(ACol,ARow);


 


  end;
end;

procedure TFrm_BOMEdt.SGridClick(Sender: TObject);
begin
  SGrid.Options:=   SGrid.Options   +   [goRowSelect];
end;

procedure TFrm_BOMEdt.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#8,#13]) then             //判断是否输入空格
  begin
  //showmessage();
    showmessage('此处仅退格键有效');
    Abort;
    Exit;
  end;
  Edit7.Text :='';
  Edit8.Text :='';
  Edit9.Text :='';
  Edit7.tag:=0;

end;

procedure TFrm_BOMEdt.FormCreate(Sender: TObject);
begin
ComboBox2.Clear;
dm.Tmp.SQL.Clear;
dm.Tmp.SQL.Text :='select production_teamname from wzcp0139';
dm.Tmp.Open;
dm.Tmp.First;
if DM.Tmp.RecordCount>0
   then
   begin
     while not dm.Tmp.Eof do
     begin
      ComboBox2.Items.Add(dm.Tmp.FieldByName('production_teamname').AsString);
      dm.Tmp.Next;
      end;
   end;
end;

end.
