unit Frm_RecvDetail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Grids;

type
  TFrm_RecvDetail = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    SGrid: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BtActNote: TButton;
    Label5: TLabel;
    Edit5: TEdit;
    Button1: TButton;
    Label6: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BtActNoteClick(Sender: TObject);
    procedure SGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGridKeyPress(Sender: TObject; var Key: Char);
    procedure SGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure Button1Click(Sender: TObject);
  private

    { Private declarations }
  public
    Foptp:integer;
  end;

var
  Frm_RecvDetail: TFrm_RecvDetail;

implementation
uses DM_u,ConstVar ,Pick_Item_Single;
{$R *.dfm}

procedure TFrm_RecvDetail.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=not ((SGrid.Row=0) or (SGrid.Row=SGrid.RowCount-1));
end;

procedure TFrm_RecvDetail.BitBtn2Click(Sender: TObject);
var i,isum:integer;
begin
  if SGrid.RowCount=2 then
  begin
    showmessage('不能保存空记录...');
    exit;
  end;
  isum:=0;
  for i:=1 to sGrid.RowCount-2 do
  begin
    if strtoint('0'+sGrid.Cells[0,i])=0 then
    begin
      showmessage('不能保存数量为0的记录...');
      exit;
    end;
    if trim(sGrid.Cells[4,i])='' then
    begin
      showmessage('第'+inttostr(i)+'条记录仓位代码不正确...');
      exit;
    end;
    isum:=isum+strtoint('0'+sGrid.Cells[0,i]);

  end;
  if strtoint(edit4.Text)<isum then
  begin
    showmessage('回收总数超过有效数...');
    exit;
  end;
  Edit5.Text:=inttostr(strtoint(edit4.Text)-isum);
  modalresult:=mrok;
end;

procedure TFrm_RecvDetail.N1Click(Sender: TObject);
var i:integer;
begin
  Edit5.Text:=inttostr(strtoint('0'+trim(sgrid.Cells[0,sgrid.Row]))+strtoint(Edit5.Text));
  for i:=sgrid.Row to sgrid.RowCount-2 do sgrid.Rows[i].Text:=trim(sgrid.Rows[i+1].Text);
  sgrid.RowCount:=sgrid.RowCount-1;
  Button1.Enabled:=true;
end;

procedure TFrm_RecvDetail.SGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  BtActNote.Visible:=false;
  if (Acol=1) and (ARow>0) then
  begin
    BtActNote.Left:=sGrid.Left+sGrid.ColWidths[0]+sGrid.ColWidths[1]-BtActNote.Width+2;
    BtActNote.Top:=ARow*(sGrid.RowHeights[0]+1)+sGrid.Top+2;
    BtActNote.Visible:=(sGrid.Cells[0,ARow]<>'') or (edit5.Text<>'0');
  end;

  if  (ARow=0) or (ACol=2) or (ACol=5) then
    sGrid.Options:=sGrid.Options-[goEditing]
  else
    sGrid.Options:=sGrid.Options+[goEditing];
end;

procedure TFrm_RecvDetail.BtActNoteClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
  i:integer;
  srkey160:string;
  s:string;
begin
  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
    srkey160:='';
    for i:=1 to sGrid.RowCount-1 do if trim(sGrid.Cells[4,i])<>'' then srkey160:=srkey160+sGrid.Cells[4,i]+',' ;
    srkey160:='('+srkey160+'0)';  //仓位不能重复

    InputVar.Fields := 'location_code/仓位代码/100,location_name/仓位名称/100,oh_degree/研磨次数/60,type_c/仓库类别/80,remark/备注/160';
    if Foptp=2 then //机器回仓
//20130114修改回收时磨次6成为未磨5--------------------------------------------------
//      InputVar.Sqlstr :='select rkey,location_code,location_name,oh_degree,remark, '+
//                        'case type when 1 then ''库房'' when 2 then ''待研磨仓'' when 3 then ''机器'' '+
//                        'when 4 then ''研磨商'' when 5 then ''报废仓''  end  Type_c,type '+
//                        'from data0160 where rkey not in '+srkey160+' and ((type in (1,2) and oh_degree='+edit3.Text+') or type=5) '+
//                        'order by location_code'
//-------------------改-----------------------------------------------------------
    begin
      if (Trim(Edit3.Text)='6') then
      begin
        InputVar.Sqlstr :='select rkey,location_code,location_name,oh_degree,remark, '+
                        'case type when 1 then ''库房'' when 2 then ''待研磨仓'' when 3 then ''机器'' '+
                        'when 4 then ''研磨商'' when 5 then ''报废仓''  end  Type_c,type '+
                        'from data0160 where rkey not in '+srkey160+' and ((type in (2) and oh_degree=5) or type=5) '+
                        'order by location_code'
      end else
      begin
        InputVar.Sqlstr :='select rkey,location_code,location_name,oh_degree,remark, '+
                        'case type when 1 then ''库房'' when 2 then ''待研磨仓'' when 3 then ''机器'' '+
                        'when 4 then ''研磨商'' when 5 then ''报废仓''  end  Type_c,type '+
                        'from data0160 where rkey not in '+srkey160+' and ((type in (1,2) and oh_degree='+edit3.Text+') or type=5) '+
                        'order by location_code'
      end;
    end
//end--------------------------------------------------------------------------------
    else begin
      if edit3.Text<>'6' then s:=edit3.Text else s:='5';
//      InputVar.Sqlstr :='select rkey,location_code,location_name,oh_degree,remark, '+
//                        'case type when 1 then ''库房'' when 2 then ''待研磨仓'' when 3 then ''机器'' '+
//                        'when 4 then ''研磨商'' when 5 then ''报废仓''  end  Type_c,type '+
//                        'from data0160 where rkey not in '+srkey160+' and ((type=1 and oh_degree-1='+s+') or (type=2 and oh_degree='+edit3.Text+
//                        ') or (type=5)) order by location_code' ;
//-------------------改-----------------------------------------------------------
      if (Trim(Edit3.Text)='6') then
      begin
        InputVar.Sqlstr :='select rkey,location_code,location_name,oh_degree,remark, '+
                        'case type when 1 then ''库房'' when 2 then ''待研磨仓'' when 3 then ''机器'' '+
                        'when 4 then ''研磨商'' when 5 then ''报废仓''  end  Type_c,type '+
                        'from data0160 where rkey not in '+srkey160+' and ((type=1 and oh_degree-1='+s+') or (type=2 and oh_degree=5) or (type=5)) order by location_code' ;
      end else
      begin
        InputVar.Sqlstr :='select rkey,location_code,location_name,oh_degree,remark, '+
                        'case type when 1 then ''库房'' when 2 then ''待研磨仓'' when 3 then ''机器'' '+
                        'when 4 then ''研磨商'' when 5 then ''报废仓''  end  Type_c,type '+
                        'from data0160 where rkey not in '+srkey160+' and ((type=1 and oh_degree-1='+s+') or (type=2 and oh_degree='+edit3.Text+
                        ') or (type=5)) order by location_code' ;
      end;
//end--------------------------------------------------------------------------------
    end;
    InputVar.AdoConn := DM.ADOCon ;
    frmPick_Item_Single2.InitForm_New(InputVar)  ;
    if frmPick_Item_Single2.ShowModal = mrok then
    begin
      if frmPick_Item_Single2.adsPick.IsEmpty then exit;
      i:=SGrid.Row;
      if trim(SGrid.Cells[0,i])='' then
      begin
        SGrid.Cells[0,i]:=edit5.Text;
        edit5.Text:='0';
      end;
      SGrid.Cells[1,i]:=frmPick_Item_Single2.adsPick.Fieldbyname('location_code').AsString; //仓位
      SGrid.Cells[2,i]:=frmPick_Item_Single2.adsPick.Fieldbyname('oh_degree').AsString;     //研磨次数
      SGrid.Cells[4,i]:=frmPick_Item_Single2.adsPick.Fieldbyname('rkey').AsString;          //rkey160
      SGrid.Cells[5,i]:=frmPick_Item_Single2.adsPick.Fieldbyname('location_name').AsString; //仓位名称
      if  SGrid.Row=SGrid.RowCount-1 then SGrid.RowCount:=SGrid.RowCount+1;
    end ;
  finally
    frmPick_Item_Single2.Free ;
  end;

end;

procedure TFrm_RecvDetail.SGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var isum,i:integer;
begin
  if sGrid.Col=0 then
  begin
    if not (key in [48..57,96..105,8]) then abort ;
    isum:=0;
    for i:=1 to sGrid.RowCount-2 do
    begin
      isum:=isum+strtoint('0'+sGrid.Cells[0,i]);
      Edit5.Text:=inttostr(strtoint(Edit4.Text)-isum);
    end;
  end else if ((sGrid.Col=1) or (sGrid.Col=2)) and (SGrid.Cells[0,SGrid.row]='') and (edit5.Text<>'0') then
  begin
    SGrid.Cells[0,SGrid.row]:=edit5.Text;
    edit5.Text:='0';
  end;

end;

procedure TFrm_RecvDetail.SGridKeyPress(Sender: TObject; var Key: Char);
var isum,i,iRow:integer;
begin
  if key=#13 then     //enter代替Tab
  begin
    postmessage(SGrid.handle,wm_keydown,vk_tab,0);
    abort;
  end;
  if (sGrid.Row=sGrid.RowCount-1) and (edit5.Text='0') then
  begin
    key:=#0;
    abort;
  end;
  if (sGrid.Row=sGrid.RowCount-1) and not (key in [#9,#13]) then
    sGrid.RowCount:=sGrid.RowCount+1;

  if sGrid.Col=0 then
  begin
    if not (key in ['0'..'9',#8]) then abort ;
    if  (key in ['0'..'9']) then
    begin
      isum:=0;
      iRow:=sGrid.Row;
      for i:=1 to sGrid.RowCount-2 do
        if i<>iRow then isum:=isum+strtoint('0'+sGrid.Cells[0,i]);
      if strtoint(Edit4.Text)<isum+strtoint('0'+sGrid.Cells[0,iRow]+key) then
      begin
        key:=#0;
        abort;
      end;

    end;
  end;
end;

procedure TFrm_RecvDetail.SGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
  var i:integer;
     srkey160 :string;
     s:string;
begin
    if ACol=1 then
    begin
      srkey160:='';
      for i:=1 to sGrid.RowCount-1 do
        if (trim(sGrid.Cells[4,i])<>'') and (i<>Arow) then srkey160:=srkey160+sGrid.Cells[4,i]+',' ;
      srkey160:='(not rkey in ('+srkey160+'0)) and ';

      DM.tmp.Close;
      if  Foptp=2 then //机器回仓
//        DM.tmp.SQL.Text:='select top 1 rkey,location_name,oh_degree,remark '+
//                         'from data0160 where location_code='''+Value+''' and '+srkey160+
//                         ' ((type in (1,2) and oh_degree='+edit3.Text+') or type=5)'
//
//-------------------改-----------------------------------------------------------
      begin
        if (Trim(Edit3.Text)='6') then
        begin
          DM.tmp.SQL.Text:='select top 1 rkey,location_name,oh_degree,remark '+
                         'from data0160 where location_code='''+Value+''' and '+srkey160+
                         ' ((type in (1,2) and oh_degree=5) or type=5)'
        end else
        begin
          DM.tmp.SQL.Text:='select top 1 rkey,location_name,oh_degree,remark '+
                         'from data0160 where location_code='''+Value+''' and '+srkey160+
                         ' ((type in (1,2) and oh_degree='+edit3.Text+') or type=5)'
        end;
      end
//emd--------------------------------------------------------------------------------
      else begin
        if edit3.Text<>'6' then s:=edit3.Text else s:='5';
//        DM.tmp.SQL.Text:='select top 1 rkey,location_name,oh_degree,remark '+
//                         'from data0160 where location_code='''+Value+''' and '+srkey160+
//                         ' ((type=1 and oh_degree-1='+s+') or (type=2 and oh_degree='+edit3.Text+
//                          ') or (type=5))' ;

//-------------------改-----------------------------------------------------------
        if (Trim(Edit3.Text)='6') then
        begin
          DM.tmp.SQL.Text:='select top 1 rkey,location_name,oh_degree,remark '+
                         'from data0160 where location_code='''+Value+''' and '+srkey160+
                         ' ((type=1 and oh_degree-1='+s+') or (type=2 and oh_degree=5) or (type=5))' ;
        end else
        begin
          DM.tmp.SQL.Text:='select top 1 rkey,location_name,oh_degree,remark '+
                         'from data0160 where location_code='''+Value+''' and '+srkey160+
                         ' ((type=1 and oh_degree-1='+s+') or (type=2 and oh_degree='+edit3.Text+
                          ') or (type=5))' ;
        end;
//end--------------------------------------------------------------------------------
      end;
      DM.tmp.Open;
      SGrid.Cells[2,ARow]:=DM.tmp.Fieldbyname('oh_degree').AsString;     //'研磨次数';
      SGrid.Cells[4,ARow]:=DM.tmp.Fieldbyname('rkey').AsString;          //rkey160
      SGrid.Cells[5,ARow]:=DM.tmp.Fieldbyname('location_name').AsString; //仓位名称
    end;
end;

procedure TFrm_RecvDetail.Button1Click(Sender: TObject);
var i,j:integer;
    b:boolean;
begin
  if edit5.Text<>'0' then
  begin
    DM.tmp.Close;
    if  Foptp=2 then //机器回仓
//      DM.tmp.SQL.Text :='select rkey,location_code,location_name,oh_degree,remark '+
//                        'from data0160 where type=2 and oh_degree='+edit3.Text
//-------------------改-----------------------------------------------------------
    begin
      if (Trim(Edit3.Text)='6') then
      begin
        DM.tmp.SQL.Text :='select rkey,location_code,location_name,oh_degree,remark '+
                        'from data0160 where type=2 and oh_degree=5'
      end else
      begin
        DM.tmp.SQL.Text :='select rkey,location_code,location_name,oh_degree,remark '+
                        'from data0160 where type=2 and oh_degree='+edit3.Text
      end;
    end
//--------------------------------------------------------------------------------
    else begin
      if edit3.Text<>'6' then
        DM.tmp.SQL.Text :='select rkey,location_code,location_name,oh_degree,remark '+
                          'from data0160 where type=1 and oh_degree-1='+edit3.Text
      else
        DM.tmp.SQL.Text :='select rkey,location_code,location_name,oh_degree,remark '+
                          'from data0160 where type=1 and oh_degree=5';
    end;
    DM.tmp.Open;
    if DM.tmp.IsEmpty then exit;
    i:=SGrid.RowCount-1;

    for j:=1 to sGrid.RowCount-1 do
      if trim(sGrid.Cells[4,j])=DM.tmp.Fieldbyname('rkey').AsString then
      begin
        b:=true;
        i:=j;
        edit5.Text:=inttostr(strtoint(edit5.Text)+strtoint(SGrid.Cells[0,j]));
        break;
      end;
     //仓位不能重复

     SGrid.Cells[0,i]:=edit5.Text;
     edit5.Text:='0';

    SGrid.Cells[1,i]:=DM.tmp.Fieldbyname('location_code').AsString; //仓位
    SGrid.Cells[2,i]:=DM.tmp.Fieldbyname('oh_degree').AsString;     //研磨次数
    SGrid.Cells[4,i]:=DM.tmp.Fieldbyname('rkey').AsString;          //rkey160
    SGrid.Cells[5,i]:=DM.tmp.Fieldbyname('location_name').AsString; //仓位名称
    if  not b then SGrid.RowCount:=SGrid.RowCount+1;
    Button1.Enabled:=false;
  end;
end;

end.
