unit Uformula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus,MyDBGrid,ADODB,DB;

type
  TFormula_Form = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGridEh1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGridEh1DragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
  public
    FRkey: string;
    FAccountid : Integer;
    { Public declarations }
  end;

var
  Formula_Form: TFormula_Form;
   SGC : TGridCoord;

implementation

uses UDM,common,UFDetail;

{$R *.dfm}

procedure TFormula_Form.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TFormula_Form.FormShow(Sender: TObject);
begin
     DM.ADODesignSalaryItem.Close;
     DM.ADODesignSalaryItem.Parameters[0].Value := FAccountid;
     DM.ADODesignSalaryItem.Open;
end;

procedure TFormula_Form.BitBtn4Click(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'工资项目') ;
end;

procedure TFormula_Form.N1Click(Sender: TObject);
begin
    case Tmenuitem(Sender).Tag of
        0,1,3: with TFDetail_Form.Create(nil) do
        begin
            Ftag:=Tmenuitem(Sender).Tag;
            FRkey := rkey73;
            if showmodal=mrok then
            begin
                DM.ADODesignSalaryItem.Close;
                DM.ADODesignSalaryItem.Open;
                //DM.ADODesignSalaryItem.Locate('rkey',Frkeymsg2,[]);
            end;
            Free;
        end;
    end;
    if Tmenuitem(Sender).Tag=2 then
    begin
        DM.ADODesignSalaryItem.Delete;
    end;
end;

procedure TFormula_Form.DBGridEh1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  DG : TDBGridEh;
begin
//  DG := Sender as TDBGridEh;
//  SGC := DG.MouseCoord(X,Y);
//  if (SGC.X > 0) and (SGC.Y > 0) then
//    (Sender as TDBGridEh).BeginDrag(False);
//   if   button=mbRight   then
//        PopupMenu1.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;
 
procedure TFormula_Form.DBGridEh1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  GC : TGridCoord;
begin
{  GC := (Sender as TDBGridEh).MouseCoord(X,Y);
  Accept := Source is TDBGridEh and (GC.X > 0) and (GC.Y > 0);
  }
end;

procedure TFormula_Form.DBGridEh1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  DG     : TDBGridEh;
  GC     : TGridCoord;
  QueryTmp:TADOQuery;
  CurRow : Integer;
  indextmp1,indextmp2,rkeytmp1,rkeytmp2 : string;
begin
{  DG := Sender as TDBGridEh;
  GC := DG.MouseCoord(X,Y);

  QueryTmp:=TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOCon;
      with DG.DataSource.DataSet do
      begin
        with (Source as TDBGridEh).DataSource.DataSet do
        begin
            Edit;
            indextmp1 := FieldByName('ItemIndex').AsString;
            rkeytmp1 := FieldByName('rkey').AsString;
            //Caption := 'You dragged "'+FieldByName('ItemIndex').AsString+'"';
            DisableControls;
            CurRow := DG.Row;
            MoveBy(GC.Y-CurRow);
            //Caption := Caption+' to "'+FieldByName('ItemIndex').AsString+'"';
            indextmp2 := FieldByName('ItemIndex').AsString;
            rkeytmp2 := FieldByName('rkey').AsString;
            MoveBy(CurRow-GC.Y);
            DM.ADOCon.BeginTrans;
            try
                QueryTmp.Close;
                QueryTmp.SQL.Clear;
                QueryTmp.SQL.Text:= ' update DesignSalaryItem set ItemIndex = '+indextmp2+' where rkey='+rkeytmp1+#13+#13+
                                    ' update DesignSalaryItem set ItemIndex = '+indextmp1+' where rkey='+rkeytmp2+#13+#13;
                      if QueryTmp.ExecSQL=0 then
                      begin
                        DM.ADOCon.RollbackTrans;
                        showmessage('移动数据失败,数据状态已发生变化...');
                      end else
                        DM.ADOCon.CommitTrans;
            except
               DM.ADOCon.RollbackTrans;
               showmessage('删除数据失败...');
            end;
            EnableControls;
            close;
            open;
        end;
      end;
  QueryTmp.Free;
  }
end;

end.
