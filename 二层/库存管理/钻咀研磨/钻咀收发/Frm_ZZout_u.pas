unit Frm_ZZout_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, Buttons, StdCtrls, DBCtrls, DBCtrlsEh, DB,
  Mask, ADODB, Menus, ActnList, ComCtrls,DateUtils;

type
  TFrm_ZZout = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SGrid: TStringGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    MaskEdit1: TMaskEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    ActionList1: TActionList;
    ActSv: TAction;
    ActEsc: TAction;
    Label10: TLabel;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    Label9: TLabel;
    Edit2: TEdit;
    BtCopy: TButton;
    Label11: TLabel;
    Edit3: TEdit;
    SpeedButton4: TSpeedButton;
    Edit4: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit5: TEdit;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Drill: TAction;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RB1Click(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGridKeyPress(Sender: TObject; var Key: Char);
    procedure BtCopyClick(Sender: TObject);
    procedure SGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure Edit5Exit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    Ftp:integer;     //仓库类型 1:store 2:wait YM 3:machine 4:YM 5:RejStore
    Foptp:integer;   //操作类型 1:store to machice 2:machice to store 3:to YM 4:YM to store
    Frkey25:integer;
  public
    class procedure init(tp:integer);
    { Public declarations }
  end;

var
  Frm_ZZout: TFrm_ZZout;

implementation
 uses common,DM_u,ConstVar ,Pick_Item_Single,Frm_detailEdt_u,Pas_Dele_u;
{$R *.dfm}

{ TFrm_ZZout }   

class procedure TFrm_ZZout.init(tp: integer);
begin
  with TFrm_ZZout.Create(nil) do
  try
    Foptp:=tp;
    SGrid.ColCount:=11;
    SGrid.RowCount:=2;
    SGrid.Cells[0,0]:='位置代码';
    SGrid.Cells[1,0]:='位置名称';
    SGrid.Cells[2,0]:='钻嘴编码';
    SGrid.Cells[3,0]:='钻嘴名称';
    SGrid.Cells[4,0]:='研磨次数';
    SGrid.Cells[5,0]:='发放数量';
    SGrid.Cells[6,0]:='备注';
    SGrid.Cells[7,0]:='rkey17';
    SGrid.Cells[8,0]:='rkey160';
    SGrid.Cells[9,0]:='rkey220';
    SGrid.Cells[10,0]:='supplier_ptr';

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

    MaskEdit1.Text := dm.Get_Data0004(0) ;
    MaskEdit1.ReadOnly:=true;

    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DateTimePicker1.DateTime:=DM.tmp.Fields[0].AsDateTime;
    stringgrid1.Visible:=false;
    RB1Click(RB1);

    if tp=1 then
    begin
      Ftp:=1;
      caption:='发放到机器';
      Label10.Caption:='主轴数';
    //  RB1Click(RB1);

      stringgrid1.Cells[0,0]:='序';
      stringgrid1.Cells[1,0]:='刀具';
      stringgrid1.Cells[2,0]:='符号';
      stringgrid1.Cells[3,0]:='成品孔径';
      stringgrid1.Cells[4,0]:='PTH';
      stringgrid1.Cells[5,0]:='公差';
      stringgrid1.Cells[6,0]:='钻咀';
      stringgrid1.Cells[7,0]:='PCS孔数';
      stringgrid1.Cells[8,0]:='A板孔数';
      stringgrid1.Cells[9,0]:='B板孔数';
      stringgrid1.Cells[10,0]:='备注';
    end else begin
      Ftp:=2;
      caption:='发放到研磨';
      Label5.Caption:='研磨供应商代码';

     // Label8.Visible:=false;
    //  GroupBox1.Visible:=false;
      RB3.Visible:=false;
      Label9.Visible:=false;
      Edit2.Visible:=false;
      BtCopy.Visible:=false;
      
      Label11.Visible:=false;
      Edit3.Visible:=false;
      SpeedButton4.Visible:=false;
     // Memo1.Height:=48;
      Button1.Visible:=false;
      Drill.Enabled:=false;
    end;
    showmodal;
  finally
    free;
  end;
end;

procedure TFrm_ZZout.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_ZZout.SpeedButton3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
    if Foptp=1 then
    begin
      InputVar.Fields := 'location_code/机器代码/80,location_name/机器名称/100,oh_degree/主轴数/120,remark/备注/150';
      InputVar.Sqlstr :='select rkey,location_code,location_name,oh_degree,remark from data0160 where type=3';
    end else begin
      InputVar.Fields := 'location_code/研磨供应商代码/100,location_name/研磨供应商名称/100,remark/备注/150';
      InputVar.Sqlstr :='select rkey,location_code,location_name,remark from data0160 where type=4';
    end;
    InputVar.AdoConn := DM.ADOCon ;
    frmPick_Item_Single2.InitForm_New(InputVar)  ;
    if frmPick_Item_Single2.ShowModal = mrok then
    begin
      if frmPick_Item_Single2.adsPick.IsEmpty then exit;
      Edit1.Text := frmPick_Item_Single2.adsPick.fieldbyname('location_code').asstring;
      Edit1.Tag:=frmPick_Item_Single2.adsPick.fieldbyname('rkey').AsInteger ;
      label6.Caption := frmPick_Item_Single2.adsPick.fieldbyname('location_name').asstring;
      if Foptp=1 then
        Edit4.text := frmPick_Item_Single2.adsPick.fieldbyname('oh_degree').asstring
      else
        Edit4.text := frmPick_Item_Single2.adsPick.fieldbyname('remark').asstring;
    end ;
  finally
    frmPick_Item_Single2.adsPick.Close;
    frmPick_Item_Single2.Free ;
  end;
end;

procedure TFrm_ZZout.SpeedButton2Click(Sender: TObject);
var i,iNum,iCurQty,iQty:integer;
    sRkey:string;
    tmpAdo:TADOQuery;
begin
  Edit1Exit(nil);
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
    tmpAdo.Parameters.ParamByName('DM1').Value:=FormatDateTime('yyyy-mm-dd',StartOfTheMonth(DateTimePicker1.Date));
    tmpAdo.Parameters.ParamByName('DM2').Value:=FormatDateTime('yyyy-mm-dd',EndOfTheMonth(DateTimePicker1.Date));
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

  if not RB2.Checked then //汇总发放  //(Ftp=1) and
  for i:=1 to SGrid.RowCount-2 do
  begin
    if (trim(SGrid.Cells[7,i])='') or (trim(SGrid.Cells[4,i])='') or (trim(SGrid.Cells[5,i])='') then
    begin
      showmessage('请输入第'+inttostr(i)+'行完整数据...');
      exit;
    end;
  end;

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select getdate()';
  DM.tmp.Open;

  DM.ADO219.Close;
  DM.ADO219.Open;
  DM.ADO219.Append;
  DM.ADO219.FieldByName('CREATE_DATE').AsDateTime:=DateTimePicker1.DateTime;
  DM.ADO219.FieldByName('SYSTEM_DATE').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
  DM.ADO219.FieldByName('handle_name').AsString:=edit5.Text;
  DM.ADO219.FieldByName('REMARK').AsString:=Memo1.Text;
  DM.ADO219.FieldByName('TTYPE').AsInteger:=1;
  DM.ADO219.FieldByName('CREATE_BY').asstring:=user_ptr;
  DM.ADO219.FieldByName('location_endptr').AsInteger:=Edit1.Tag;
  if Ftp=1 then
    DM.ADO219.FieldByName('TTYPE').AsInteger:=1  //发到机器
  else
    DM.ADO219.FieldByName('TTYPE').AsInteger:=3; //发到研磨

  DM.ADO220.Open;
  DM.ADO270.Open;
  DM.ADOCon.BeginTrans;
  try
    MaskEdit1.Text := dm.Get_Data0004(1,MaskEdit1.Text) ;
    DM.ADO219.FieldByName('GRN_NUMBER').AsString:=MaskEdit1.Text;
    DM.ADO219.UpdateBatch(arAll);
    for i:=1 to SGrid.RowCount-2 do
    begin
      if  not RB2.Checked then //汇总发放 //(Ftp=1) and
      begin
        DM.tmp.Close;
        DM.tmp.SQL.Text:='select sum(data0220.quan_on_hand-data0220.Quan_alloc) from data0220 inner join data0160 on data0220.location_ptr=data0160.rkey where data0220.inventory_ptr='+SGrid.Cells[7,i]+
                         ' and data0220.oh_degree='+SGrid.Cells[4,i]+' and data0220.quan_on_hand-data0220.Quan_alloc>0 and data0160.type='+inttostr(Ftp);
        DM.tmp.Open;
        iNum:=strtoint(SGrid.Cells[5,i]);
        if DM.tmp.Fields[0].AsInteger<iNum then
        begin
          DM.ADOCon.RollbackTrans;
          showmessage(SGrid.Cells[0,i]+'仓库有效库存不足,数据保存失败...');
          exit;
        end;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='select data0220.quan_on_hand-data0220.Quan_alloc as valQty,* from data0220 inner join data0160 on data0220.location_ptr=data0160.rkey where data0220.inventory_ptr='+SGrid.Cells[7,i]+
                         ' and data0220.oh_degree='+SGrid.Cells[4,i]+' and data0220.quan_on_hand-data0220.Quan_alloc>0 and data0160.type='+inttostr(Ftp)+' order by data0220.grn_ptr';
        DM.tmp.Open;
        iQty:=0;
        while not DM.tmp.Eof do
        begin
          DM.ADO220.Append;
          DM.ADO220.FieldByName('grn_ptr').AsInteger:=DM.ADO219.fieldbyname('rkey').AsInteger;
          DM.ADO220.FieldByName('inventory_ptr').AsString:=SGrid.Cells[7,i];
          DM.ADO220.FieldByName('location_ptr').AsString:=DM.ADO219.fieldbyname('location_endptr').Asstring;
          DM.ADO220.FieldByName('oh_degree').AsString:=SGrid.Cells[4,i];
          DM.ADO220.FieldByName('remark').AsString:=SGrid.Cells[6,i];
          DM.ADO220.FieldByName('supplier_ptr').AsString:=DM.tmp.FieldByName('supplier_ptr').AsString;
          iCurQty:=DM.tmp.FieldByName('valQty').AsInteger;
          sRkey:=DM.tmp.FieldByName('rkey').AsString;
          if iCurQty+iQty<iNum then
          begin
            DM.ADO220.FieldByName('quantity').AsString:=inttostr(iCurQty);
            DM.ADO220.FieldByName('quan_on_hand').AsString:=inttostr(iCurQty);
          end else begin
            DM.ADO220.FieldByName('quantity').AsString:=inttostr(iNum-iQty);
            DM.ADO220.FieldByName('quan_on_hand').AsString:=inttostr(iNum-iQty);
          end;
          DM.ADO220.Post;
          
          DM.ADO270.Append;
          DM.ADO270.FieldByName('bach_fromptr').AsString:=DM.tmp.fieldbyname('rkey').AsString;
          DM.ADO270.FieldByName('bach_endptr').AsString:=DM.ADO220.FieldByName('rkey').AsString;
          DM.ADO270.FieldByName('empl_ptr').AsString:=user_ptr;
          DM.ADO270.FieldByName('Tdate').AsDateTime:=DM.ADO219.FieldByName('CREATE_DATE').AsDateTime;
          DM.ADO270.FieldByName('quantity').AsString:=DM.ADO220.FieldByName('quantity').AsString;
          DM.ADO270.FieldByName('type').AsString:=DM.ADO219.FieldByName('TTYPE').AsString;
          DM.ADO270.FieldByName('ref_number').AsString:=DM.ADO220.FieldByName('remark').AsString;
          DM.ADO270.Post;

          DM.tmp1.Close;
          DM.tmp1.SQL.Text:='update data0220 set quan_on_hand=quan_on_hand-'+DM.ADO220.FieldByName('quantity').AsString+
                           ' where rkey='+sRkey+' and quan_on_hand>='+DM.ADO220.FieldByName('quantity').AsString ;

          if DM.tmp1.ExecSQL=0 then
          begin
            DM.ADOCon.RollbackTrans;
            showmessage(SGrid.Cells[0,i]+'仓库有效库存不足,数据保存失败...');
            exit;
          end;
          if iCurQty+iQty>=iNum then  break;
          iQty:=iQty+iCurQty;
          DM.tmp.Next;
        end;
      end else begin //批次发放
        DM.ADO220.Append;
        DM.ADO220.FieldByName('grn_ptr').AsInteger:=DM.ADO219.fieldbyname('rkey').AsInteger;
        DM.ADO220.FieldByName('inventory_ptr').AsString:=SGrid.Cells[7,i];
        DM.ADO220.FieldByName('supplier_ptr').AsString:=SGrid.Cells[10,i];
        DM.ADO220.FieldByName('location_ptr').AsString:=DM.ADO219.fieldbyname('location_endptr').Asstring;
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
        DM.ADO270.FieldByName('Tdate').AsDateTime:=DM.ADO219.FieldByName('CREATE_DATE').AsDateTime;
        DM.ADO270.FieldByName('quantity').AsString:=DM.ADO220.FieldByName('quantity').AsString;
        DM.ADO270.FieldByName('type').AsString:=DM.ADO219.FieldByName('TTYPE').AsString;
        DM.ADO270.FieldByName('ref_number').AsString:=DM.ADO220.FieldByName('remark').AsString;
        DM.ADO270.Post;

        DM.tmp.Close;
        DM.tmp.SQL.Text:='update data0220 set quan_on_hand=quan_on_hand-'+DM.ADO220.FieldByName('quantity').AsString+
                         ' where rkey='+SGrid.Cells[9,i]+' and quan_on_hand>='+DM.ADO220.FieldByName('quantity').AsString ;
        if DM.tmp.ExecSQL=0 then
        begin
          DM.ADOCon.RollbackTrans;
          showmessage(SGrid.Cells[0,i]+'仓库有效库存不足,数据保存失败...');
          exit;
        end;
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

procedure TFrm_ZZout.Edit1Exit(Sender: TObject);
var s:string;
begin
  if Edit1.Text<>'' then
  begin
    DM.tmp.Close;
    if Foptp=1 then s:='3' else s:='4';
    DM.tmp.SQL.Text:='select rkey,location_code,location_name,oh_degree,remark from data0160 where location_code='''+
                     Edit1.Text+''' and type='+s;
    DM.tmp.Open;
    if not DM.tmp.IsEmpty then
    begin
      label6.Caption := DM.tmp.fieldbyname('location_name').asstring;
      if Foptp=1 then
        Edit4.text := DM.tmp.fieldbyname('oh_degree').asstring
      else
        Edit4.text := DM.tmp.fieldbyname('remark').asstring;
      Edit1.Tag:=DM.tmp.fieldbyname('rkey').AsInteger ;
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

procedure TFrm_ZZout.N1Click(Sender: TObject);
begin
  GroupBox1.Enabled:=not TFrm_detailEdt.InitEdt(Ftp,sGrid) ;
end;

procedure TFrm_ZZout.PopupMenu1Popup(Sender: TObject);
begin
  N3.Enabled:=not ((SGrid.Row=0) or (SGrid.Row=SGrid.RowCount-1));
  N1.Enabled:=RB2.Checked;  //(Ftp=2) or
end;

procedure TFrm_ZZout.N3Click(Sender: TObject);
var i,iSum:integer;
begin
  if sgrid.RowCount <= 2 then exit;
  for i:=sgrid.Row to sgrid.RowCount-2 do sgrid.Rows[i].Text:=sgrid.Rows[i+1].Text;
  sgrid.RowCount:=sgrid.RowCount-1;
  GroupBox1.Enabled:=sgrid.RowCount=2;
  iSum:=0;
  for i:=1 to SGrid.RowCount-2 do
  begin
    iSum:=iSum+StrToInt(SGrid.Cells[5,i]);
  end;
  SGrid.Cells[4,SGrid.RowCount-1]:='合计';
  SGrid.Cells[5,SGrid.RowCount-1]:=IntToStr(iSum);
end;

procedure TFrm_ZZout.SGridMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TFrm_ZZout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) and not (ActiveControl is TCustomMemo) and not (ActiveControl is TCustomGrid)  then
   SelectNext(ActiveControl,true,true);
end;

procedure TFrm_ZZout.RB1Click(Sender: TObject);
begin
  if Tcomponent(Sender).Tag in [0,2] then
  begin
    SGrid.ColWidths[0]:=-1;
    SGrid.ColWidths[1]:=-1;
  end else begin
    SGrid.ColWidths[0]:=80;
    SGrid.ColWidths[1]:=80;
  end;
  BtCopy.Enabled:=RB3.Checked; 
end;

procedure TFrm_ZZout.SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  //if Ftp=2 then exit;
  if (not RB2.Checked and ((ACol=2) or (ACol=4) or (ACol=5))) or (ACol=6) then
     sGrid.Options:=sGrid.Options+[goEditing]
  else
    sGrid.Options:=sGrid.Options-[goEditing];

 { if RB2.Checked or (ACol=3) then
    sGrid.Options:=sGrid.Options-[goEditing]
  else if (ACol=2) or (ACol=4) or (ACol=5) or (ACol=6) then
    sGrid.Options:=sGrid.Options+[goEditing]; }
end;

procedure TFrm_ZZout.SGridKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    if SGrid.Col=6 then
    begin
      if trim(SGrid.Cells[3,SGrid.Row+1])='' then SGrid.Col:=2 else SGrid.Col:=4;
      SGrid.Row:=SGrid.Row+1;
    end else if SGrid.Col=2 then
      SGrid.Col:=4 
    else
      postmessage(SGrid.handle,wm_keydown,vk_tab,0);   //enter代替Tab
    abort;
  end;
 // if  RB2.Checked then abort;    // (Ftp=2) or
  if not  RB2.Checked and (sGrid.Row=sGrid.RowCount-1) and not (key in [#9,#13]) then
  begin
    sGrid.RowCount:=sGrid.RowCount+1;
    GroupBox1.Enabled:=false;
  end else if RB2.Checked and (sGrid.Row=sGrid.RowCount-1) and not (key in [#9,#13]) then
  begin
    key:=#0;
    abort;
  end;
  if sGrid.Col=4  then
  begin
    if not (key in ['0'..'6',#8]) then abort;
    if (length(trim(SGrid.Cells[4,SGrid.Row]))=1) and (key<>#8) then begin key:=#0;abort;end
  end else if sGrid.Col=5  then
     if not (key in ['0'..'9',#8]) then abort ;
end;

procedure TFrm_ZZout.BtCopyClick(Sender: TObject);
var i:integer;
begin
  if Edit2.Text='' then exit;
  i:=1;
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select distinct d220.inventory_ptr,d17.INV_PART_NUMBER,d17.inv_part_description from '+
                   'data0220 d220 inner join data0219 d219 on d220.grn_ptr=d219.rkey '+
                   'inner join data0017 d17 on d220.inventory_ptr=d17.rkey '+
                   'where d219.grn_number='''+Edit2.Text+'''';
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
    showmessage('单号不存在...')
  else while not DM.tmp.Eof do  begin
    SGrid.Cells[2,i]:=DM.tmp.Fields[1].AsString;  //钻嘴编码
    SGrid.Cells[3,i]:=DM.tmp.Fields[2].AsString;  //钻嘴名称
    SGrid.Cells[7,i]:=DM.tmp.Fields[0].AsString;  //rkey17
    DM.tmp.Next;
    sGrid.RowCount:=sGrid.RowCount+1;
    inc(i);
  end;
  GroupBox1.Enabled:=sGrid.RowCount=2;
end;

procedure TFrm_ZZout.SGridSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
 // if Ftp=2 then exit;
  if ACol=2 then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select top 1 d17.rkey,d17.INV_PART_NUMBER,d17.inv_part_description from data0220 d220 '+
                     'inner join data0017 d17 on d220.inventory_ptr=d17.rkey inner join data0160 on d220.location_ptr=data0160.rkey '+
                     'where d17.INV_PART_NUMBER='''+Value+''' and data0160.type='+inttostr(Ftp);
    DM.tmp.Open;
    SGrid.Cells[3,ARow]:=DM.tmp.Fieldbyname('inv_part_description').AsString;
    SGrid.Cells[7,ARow]:=DM.tmp.Fields[0].AsString;
  end ;
end;

procedure TFrm_ZZout.Edit5Exit(Sender: TObject);
begin
  if (Ftp=1) and not RB2.Checked then
  begin
    SGrid.SetFocus;
    SGrid.Col:=2;
    SGrid.Row:=SGrid.RowCount-1;
  end;
end;

procedure TFrm_ZZout.SpeedButton4Click(Sender: TObject);
var i:integer;
begin
  if edit3.Text<>'' then
  with dm.tmp do
  begin
    Close;
    SQL.Text:='select rkey from data0025 where manu_part_number='''+edit3.Text+'''';
    Open;
    if IsEmpty then
    begin
      stringgrid1.Visible:=false;
      showmessage('本厂编号不存在....');
      exit;
    end;
    if Frkey25<>Fields[0].AsInteger then
    begin
      Frkey25:=Fields[0].AsInteger;
      close;
      sql.Text:='SELECT TOP 100 PERCENT SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,UNIT,'+
                'PANEL_A, PANEL_B, REMARK '+
                'FROM dbo.Data0029 where source_ptr='+inttostr(Frkey25)+' ORDER BY SEQ_NO';
      open;
      stringgrid1.RowCount:=RecordCount+2;
      for i:=1 to RecordCount do
      begin
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=trim(fieldbyname('SEQ_NR').AsString); //'刀具';
        stringgrid1.Cells[2,i]:=trim(fieldbyname('MARK').AsString);//'符号';
        stringgrid1.Cells[3,i]:=trim(fieldbyname('HOLES_DIA').AsString);//'成品孔径';
        stringgrid1.Cells[4,i]:=trim(fieldbyname('PTH').AsString);//'PTH';
        stringgrid1.Cells[5,i]:=trim(fieldbyname('TOLERANCE').AsString);//'公差';
        stringgrid1.Cells[6,i]:=trim(fieldbyname('DRILL_DIA').AsString);//'钻咀';
        stringgrid1.Cells[7,i]:=trim(fieldbyname('UNIT').AsString);//'PCS孔数';
        stringgrid1.Cells[8,i]:=trim(fieldbyname('PANEL_A').AsString);//'A板孔数';
        stringgrid1.Cells[9,i]:=trim(fieldbyname('PANEL_B').AsString);//'B板孔数';
        stringgrid1.Cells[10,i]:=trim(fieldbyname('REMARK').AsString);//'备注';
        next;
      end;
    end ;
    stringgrid1.Visible:=true;
    Button1.Caption:='隐藏';
  end;
end;

procedure TFrm_ZZout.Button1Click(Sender: TObject);
begin
  stringgrid1.Visible:=not stringgrid1.Visible;
  if stringgrid1.Visible then Button1.Caption:='隐藏' else Button1.Caption:='显示';
end;

procedure TFrm_ZZout.FormShow(Sender: TObject);
begin
  if (common.rkey73='') then
  begin
    Edit5.Text:=common.user_ptr;
  end else
    Edit5.Text:= dm.Get0073(StrToInt(common.rkey73));
//2017-10-18tang添加默认机台
  DM.Tmp.close;
//end 2017-10-18tang添加默认机台
end;

procedure TFrm_ZZout.SpeedButton5Click(Sender: TObject);
begin
//      InputVar.Fields := 'grn_number/入库单号/100,create_date/创建日期/120,oh_degree/研磨次数/60,QUANTITY/发放数量/100';
//      InputVar.Sqlstr :='select data0219.*,dbo.data0220.* from dbo.data0220 inner join dbo.data0219 on dbo.data0220.GRN_PTR=dbo.data0219.RKey'
//      +' where dbo.data0219.TTYPE=1 and dbo.data0219.location_endptr='+IntToStr(Edit1.Tag)+' and convert(char(10),data0219.create_date,120)='''+DateToStr(DateTimePicker1.Date)+'''';
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

end.
