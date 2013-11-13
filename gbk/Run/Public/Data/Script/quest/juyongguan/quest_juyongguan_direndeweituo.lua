--���˵�ί��

--MisDescBegin
x206012_g_ScriptId = 206012
x206012_g_MissionIdPre =38
x206012_g_MissionId = 39
x206012_g_MissionKind = 8
x206012_g_MissionLevel = 40
--x206012_g_ScriptIdNext = {ScriptId = 206005 ,LV = 1 }
x206012_g_Name	="�����" 
x206012_g_Name2	="�׷�����" 

x206012_g_MissionName="���˵�ί��"
x206012_g_MissionInfo="    ��Ȼ���ǵĻʵۺ����ܣ�������Ϊ���ӣ���ʹ���������Ҳ��Թ�޻ڣ�\n \n    ֻ�ǣ���һ��������һֱ���Ĳ��£�һλ������ʮ����ǰ���ز���Ϊ�������ĺ��Ӳ������ܿ࣬�����ɵı߾��������������͸���������ʵ�ĺ�������\n \n    ��������������֮ǰ��������һ�����𴦻��ĵ�ʿ���������Ȼ��ˡ������ٻ�ȥ�������ӵ�ʱ���Ѿ�û�������䡣\n \n    ��ʮ�����������˼����ģ�����Ϊ��Ѱ�����ĺ��ӡ�ֻ��ϧ���޷���������һ�������Ĵ��塣��ϣ�����ܹ�����������"  --��������
x206012_g_MissionTarget="    �����׷����ˡ�"		
x206012_g_MissionComplete="    �����ּ����ˣ������������������Ե������ܰ����һ��ҵĶ��ӣ���һ���ᱨ����ģ�\n \n    ��ʮ���������Ҵ����ɱ߾�һֱ��Ѱ�ҵ��������Һ��ӵ��ˣ�ֻ������ս�ң�����ȫ�ޣ��ò����ײ��ҵ���һЩ��Ϣ��"					--�������npc˵���Ļ�
x206012_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x206012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206012_g_RadioItemBonus={}

--MisDescEnd
x206012_g_ExpBonus = 1000

--**********************************

--������ں���

--**********************************

function x206012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206012_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x206012_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x206012_g_MissionName)
			AddText(sceneId,x206012_g_MissionComplete)
		        AddMoneyBonus(sceneId, x206012_g_MoneyBonus)
			EndEvent()
		        DispatchMissionContinueInfo(sceneId, selfId, targetId, x206012_g_ScriptId, x206012_g_MissionId)
		end
        elseif x206012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206012_g_MissionName)
                AddText(sceneId,x206012_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206012_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206012_g_ScriptId, x206012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x206012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206012_g_ScriptId, x206012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x206012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x206012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206012_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==6) then
        	if IsMissionHaveDone(sceneId, selfId, x206012_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x206012_g_Name) then
        		        if IsHaveMission(sceneId,selfId, x206012_g_MissionId)<= 0 then
        		            return 1
        		        end
        		elseif (GetName(sceneId,targetId)==x206012_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x206012_g_MissionId) > 0 then
				    return 1
        		            end
        		end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x206012_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x206012_g_MissionId, x206012_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x206012_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x206012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206012_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206012_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x206012_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206012_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206012_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206012_g_MissionId)
		AddExp(sceneId, selfId, x206012_g_ExpBonus)
		AddMoney(sceneId, selfId, x206012_g_MoneyBonus)
		for i, item in pairs(x206012_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        --CallScriptFunction( x206012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x206012_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x206012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206012_OnItemChanged(sceneId, selfId, itemdataId)

end

